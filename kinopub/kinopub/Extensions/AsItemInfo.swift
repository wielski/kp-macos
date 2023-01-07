//
//  AsItemInfo.swift
//  kinopub
//
//  Created by Andrzej Wielski on 05.01.2023.
//

import Foundation
import KinopubApi

extension MovieItem {
    func asItemInfo() -> ItemInfo {
        return ItemInfo(
            id: self.id,
            title: self.title,
            type: self.type,
            subtype: self.subtype,
            year: self.year,
            cast: self.cast,
            director: self.director,
            voice: self.voice,
            duration: self.duration,
            langs: self.langs,
            ac3: self.ac3,
            subtitles: self.subtitles,
            quality: self.quality,
            genres: self.genres,
            countries: self.countries,
            plot: self.plot,
            tracklist: self.tracklist,
            imdb: self.imdb,
            imdbRating: self.imdbRating,
            imdbVotes: self.imdbVotes,
            kinopoisk: self.kinopoisk,
            kinopoiskRating: self.kinopoiskRating,
            kinopoiskVotes: self.kinopoiskVotes,
            rating: self.rating,
            ratingPercentage: self.ratingPercentage,
            ratingVotes: self.ratingVotes,
            views: self.views,
            comments: self.comments,
            finished: self.finished,
            advert: self.advert,
            inWatchlist: self.inWatchlist,
            subscribed: self.subscribed,
            posters: self.posters,
            trailer: self.trailer
        )
    }
}

extension SerialItem {
    func asItemInfo() -> ItemInfo {
        return ItemInfo(
            id: self.id,
            title: self.title,
            type: self.type,
            subtype: self.subtype,
            year: self.year,
            cast: self.cast,
            director: self.director,
            voice: self.voice,
            duration: self.duration,
            langs: self.langs,
            ac3: self.ac3,
            subtitles: self.subtitles,
            quality: self.quality,
            genres: self.genres,
            countries: self.countries,
            plot: self.plot,
            tracklist: self.tracklist,
            imdb: self.imdb,
            imdbRating: self.imdbRating,
            imdbVotes: self.imdbVotes,
            kinopoisk: self.kinopoisk,
            kinopoiskRating: self.kinopoiskRating,
            kinopoiskVotes: self.kinopoiskVotes,
            rating: self.rating,
            ratingPercentage: self.ratingPercentage,
            ratingVotes: self.ratingVotes,
            views: self.views,
            comments: self.comments,
            finished: self.finished,
            advert: self.advert,
            inWatchlist: self.inWatchlist,
            subscribed: self.subscribed,
            posters: self.posters,
            trailer: self.trailer
        )
    }
}
