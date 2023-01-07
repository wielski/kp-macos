//
//  PlayerViewModel.swift
//  kinopub
//
//  Created by Andrzej Wielski on 06.01.2023.
//

import Foundation
import KinopubApi

struct PlayerUrls {
    // hls4 only one url
    var hls4: String?
    // hls, hls2, http - map[key: url]
    var hls2: [String: String]?
    var hls: [String: String]?
    var http: [String: String]?
}

class PlayerViewModel: PlayerViewModelable {
    @Published private(set) var urls: PlayerUrls?
    @Published private(set) var subtitles: [Subtitle] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var isError: Bool = false

    var onError: ((Error) -> Void)?

    func fetchData(id: Int) async {
        DispatchQueue.main.async {
            // reset
            self.urls = nil
            self.subtitles = []
            self.isError = false
            self.isLoading = true
        }

        KinopubDefaultAPI.getMediaLinks(
            mid: Int64(id)
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
                    self.urls = PlayerUrls(
                        hls4: self.getHls4Url(response.files ?? []),
                        hls2: self.getUrlsByType(response.files ?? [], for: \FileUrl.hls2),
                        hls: self.getUrlsByType(response.files ?? [], for: \FileUrl.hls),
                        http: self.getUrlsByType(response.files ?? [], for: \FileUrl.http)
                    )
                }
            }
        }
    }

    func getHls4Url(_ files: [File]) -> String? {
        if files.isEmpty {
            return nil
        }
        let firstFile = files[0]
        return firstFile.url?.hls4
    }

    func getUrlsByType(_ files: [File], for keyPath: KeyPath<FileUrl, String?>) -> [String: String]? {
        if files.isEmpty {
            return nil
        }

        return files.reduce(into: [String: String]()) {partialResult, file in
            if let url = file.url?[keyPath: keyPath] {
                partialResult[file.quality!] = url
            }
        }
    }
}
