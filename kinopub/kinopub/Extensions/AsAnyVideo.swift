//
//  AsAnyVideo.swift
//  kinopub
//
//  Created by Andrzej Wielski on 07.01.2023.
//

import Foundation
import KinopubApi

struct AnyVideo {
    var id: Int64?
    var title: String?
    var thumbnail: String?
    var season: Int?
    var episode: Int?
    var isWatched: Bool?
    var isStarted: Bool?
    var duration: Int64?
    var timing: Int64?
}

extension Video {
    func asAnyVideo() -> AnyVideo {
        return AnyVideo(
            id: self.id,
            title: self.title,
            thumbnail: self.thumbnail,
            isWatched: self.watching?.status == Status._1,
            isStarted: self.watching?.status == Status._0,
            duration: self.duration,
            timing: self.watching?.time
        )
    }
}

extension Episode {
    func asAnyVideo() -> AnyVideo {
        return AnyVideo(
            id: self.id,
            title: self.title,
            thumbnail: self.thumbnail,
            season: self.snumber,
            episode: self.number,
            isWatched: self.watching?.status == Status._1,
            isStarted: self.watching?.status == Status._0,
            duration: self.duration,
            timing: self.watching?.time
        )
    }
}

