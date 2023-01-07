//
// SerialItem.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SerialItem: Codable, JSONEncodable, Hashable {

    public var id: Int64?
    public var title: String?
    public var type: ModelType?
    public var subtype: String?
    public var year: Int64?
    public var cast: String?
    public var director: String?
    public var voice: String?
    public var duration: ItemInfoDuration?
    public var langs: Int?
    public var ac3: Int?
    public var subtitles: Int?
    public var quality: Int?
    public var genres: [Genre]?
    public var countries: [Country]?
    public var plot: String?
    public var tracklist: [ItemInfoTracklistInner]?
    public var imdb: Int?
    public var imdbRating: Double?
    public var imdbVotes: Int?
    public var kinopoisk: Int?
    public var kinopoiskRating: Double?
    public var kinopoiskVotes: Int?
    public var rating: Double?
    public var ratingPercentage: Double?
    public var ratingVotes: Int?
    public var views: Int?
    public var comments: Int?
    public var finished: Bool?
    public var advert: Bool?
    public var inWatchlist: Bool?
    public var subscribed: Bool?
    public var posters: Posters?
    public var trailer: ItemInfoTrailer?
    public var seasons: [Season]

    public init(id: Int64? = nil, title: String? = nil, type: ModelType? = nil, subtype: String? = nil, year: Int64? = nil, cast: String? = nil, director: String? = nil, voice: String? = nil, duration: ItemInfoDuration? = nil, langs: Int? = nil, ac3: Int? = nil, subtitles: Int? = nil, quality: Int? = nil, genres: [Genre]? = nil, countries: [Country]? = nil, plot: String? = nil, tracklist: [ItemInfoTracklistInner]? = nil, imdb: Int? = nil, imdbRating: Double? = nil, imdbVotes: Int? = nil, kinopoisk: Int? = nil, kinopoiskRating: Double? = nil, kinopoiskVotes: Int? = nil, rating: Double? = nil, ratingPercentage: Double? = nil, ratingVotes: Int? = nil, views: Int? = nil, comments: Int? = nil, finished: Bool? = nil, advert: Bool? = nil, inWatchlist: Bool? = nil, subscribed: Bool? = nil, posters: Posters? = nil, trailer: ItemInfoTrailer? = nil, seasons: [Season]) {
        self.id = id
        self.title = title
        self.type = type
        self.subtype = subtype
        self.year = year
        self.cast = cast
        self.director = director
        self.voice = voice
        self.duration = duration
        self.langs = langs
        self.ac3 = ac3
        self.subtitles = subtitles
        self.quality = quality
        self.genres = genres
        self.countries = countries
        self.plot = plot
        self.tracklist = tracklist
        self.imdb = imdb
        self.imdbRating = imdbRating
        self.imdbVotes = imdbVotes
        self.kinopoisk = kinopoisk
        self.kinopoiskRating = kinopoiskRating
        self.kinopoiskVotes = kinopoiskVotes
        self.rating = rating
        self.ratingPercentage = ratingPercentage
        self.ratingVotes = ratingVotes
        self.views = views
        self.comments = comments
        self.finished = finished
        self.advert = advert
        self.inWatchlist = inWatchlist
        self.subscribed = subscribed
        self.posters = posters
        self.trailer = trailer
        self.seasons = seasons
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case title
        case type
        case subtype
        case year
        case cast
        case director
        case voice
        case duration
        case langs
        case ac3
        case subtitles
        case quality
        case genres
        case countries
        case plot
        case tracklist
        case imdb
        case imdbRating = "imdb_rating"
        case imdbVotes = "imdb_votes"
        case kinopoisk
        case kinopoiskRating = "kinopoisk_rating"
        case kinopoiskVotes = "kinopoisk_votes"
        case rating
        case ratingPercentage = "rating_percentage"
        case ratingVotes = "rating_votes"
        case views
        case comments
        case finished
        case advert
        case inWatchlist = "in_watchlist"
        case subscribed
        case posters
        case trailer
        case seasons
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(subtype, forKey: .subtype)
        try container.encodeIfPresent(year, forKey: .year)
        try container.encodeIfPresent(cast, forKey: .cast)
        try container.encodeIfPresent(director, forKey: .director)
        try container.encodeIfPresent(voice, forKey: .voice)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(langs, forKey: .langs)
        try container.encodeIfPresent(ac3, forKey: .ac3)
        try container.encodeIfPresent(subtitles, forKey: .subtitles)
        try container.encodeIfPresent(quality, forKey: .quality)
        try container.encodeIfPresent(genres, forKey: .genres)
        try container.encodeIfPresent(countries, forKey: .countries)
        try container.encodeIfPresent(plot, forKey: .plot)
        try container.encodeIfPresent(tracklist, forKey: .tracklist)
        try container.encodeIfPresent(imdb, forKey: .imdb)
        try container.encodeIfPresent(imdbRating, forKey: .imdbRating)
        try container.encodeIfPresent(imdbVotes, forKey: .imdbVotes)
        try container.encodeIfPresent(kinopoisk, forKey: .kinopoisk)
        try container.encodeIfPresent(kinopoiskRating, forKey: .kinopoiskRating)
        try container.encodeIfPresent(kinopoiskVotes, forKey: .kinopoiskVotes)
        try container.encodeIfPresent(rating, forKey: .rating)
        try container.encodeIfPresent(ratingPercentage, forKey: .ratingPercentage)
        try container.encodeIfPresent(ratingVotes, forKey: .ratingVotes)
        try container.encodeIfPresent(views, forKey: .views)
        try container.encodeIfPresent(comments, forKey: .comments)
        try container.encodeIfPresent(finished, forKey: .finished)
        try container.encodeIfPresent(advert, forKey: .advert)
        try container.encodeIfPresent(inWatchlist, forKey: .inWatchlist)
        try container.encodeIfPresent(subscribed, forKey: .subscribed)
        try container.encodeIfPresent(posters, forKey: .posters)
        try container.encodeIfPresent(trailer, forKey: .trailer)
        try container.encode(seasons, forKey: .seasons)
    }
}

