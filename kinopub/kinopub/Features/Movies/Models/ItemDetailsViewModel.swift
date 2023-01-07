//
//  ItemDetailsViewModel.swift
//  kinopub
//
//  Created by Andrzej Wielski on 04.01.2023.
//

import Foundation
import KinopubApi

class ItemDetailsViewModel: ItemDetailsViewModelable {
    @Published private(set) var movie: MovieItem?
    @Published private(set) var serial: SerialItem?
    @Published private(set) var nextVideo: AnyVideo?
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var isError: Bool = false

    var onError: ((Error) -> Void)?

    func toggleWatchList() async {
        if let serial = self.serial,
           let id = serial.id {
            KinopubDefaultAPI.toggleWatchList(
                id: Int64(id)
            ) { response, error in
                DispatchQueue.main.async {
                    if let response = response {
                        self.serial?.inWatchlist = response.watching
                    }
                }
            }
        }
    }

    func fetchData(id: Int) async {
        DispatchQueue.main.async {
            // reset
            self.movie = nil
            self.serial = nil
            self.nextVideo = nil
            self.isError = false
            self.isLoading = true
        }

        KinopubDefaultAPI.getItem(
            id: Int64(id)
        ) { response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                self.isError = false

                guard error == nil else {
                    self.isError = true
                    self.onError?(error!)
                    return
                }

                if let response = response {
                    switch(response.item ?? .none) {
                    case .typeMovieItem(let movieItem):
                        self.movie = movieItem

                        if let unwatched = getFirstUnwatchedVideo(movieItem) {
                            self.nextVideo = AnyVideo(
                                id: unwatched.video.id,
                                timing: unwatched.isFirst ? 0 : unwatched.video.watching?.time ?? 0
                            )
                        }
                        break
                    case .typeSerialItem(let serialItem):
                        self.serial = serialItem

                        if let unwatched = getFirstUnwatchedEpisode(serialItem) {
                            self.nextVideo = AnyVideo(
                                id: unwatched.episode.id,
                                season: unwatched.episode.snumber,
                                episode: unwatched.episode.number,
                                timing: unwatched.isFirst ? 0 : unwatched.episode.watching?.time ?? 0
                            )
                        }
                        break
                    case .none: break
                    }
                }
            }
        }
    }
}

func getFirstUnwatchedVideo(_ movieItem: MovieItem) -> (video: Video, isFirst: Bool)? {
    let firstUnwatched = movieItem.videos.first(where: { video in
        return video.watching?.status == Status._0 || video.watching?.status == Status.number1
    }) ?? nil

    if let firstUnwatched = firstUnwatched {
        return (firstUnwatched, false)
    }

    if let firstVideo = movieItem.videos.first {
        return (firstVideo, true)
    }

    return nil
}

func getFirstUnwatchedEpisode(_ serialItem: SerialItem) -> (episode: Episode, isFirst: Bool)? {
    let episodes = serialItem.seasons.map { season in
        return season.episodes ?? []
    }
    .flatMap { $0 }

    let firstUnwatched = episodes.first(where: { episode in
        return episode.watching?.status == Status._0 || episode.watching?.status == Status.number1
    })

    if let firstUnwatched = firstUnwatched {
        return (firstUnwatched, false)
    }

    if let firstEpisode = episodes.first {
        return (firstEpisode, true)
    }

    return nil
}
