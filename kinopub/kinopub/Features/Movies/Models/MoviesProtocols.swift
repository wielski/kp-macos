//
//  WhatToWatchViewModelable.swift
//  kinopub
//
//  Created by Andrzej Wielski on 03.01.2023.
//

import Foundation
import KinopubApi

protocol WhatToWatchViewModelable: ObservableObject {
    var items: [ItemInfo] { get }
    var isLoading: Bool { get }
    var isError: Bool { get }
    func fetchData() async
}

protocol ItemDetailsViewModelable: ObservableObject {
    var movie: MovieItem? { get }
    var serial: SerialItem? { get }
    var nextVideo: AnyVideo? { get }
    var isLoading: Bool { get }
    var isError: Bool { get }
    func fetchData(id: Int) async
    func toggleWatchList() async
}

protocol PlayerViewModelable: ObservableObject {
    var urls: PlayerUrls? { get }
    var isLoading: Bool { get }
    var isError: Bool { get }
    func fetchData(id: Int) async
}

protocol VoteViewModelable: ObservableObject {
    var liked: Bool? { get }
    var voted: Bool? { get }
    var total: String? { get }
    var positive: String? { get }
    var negative: String? { get }
    var isLoading: Bool { get }
    var isError: Bool { get }
    func voteFor(id: Int, like: Bool) async
}
