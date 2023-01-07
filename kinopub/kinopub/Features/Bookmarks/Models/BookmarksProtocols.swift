//
//  Protocols.swift
//  kinopub
//
//  Created by Andrzej Wielski on 07.01.2023.
//

import Foundation
import KinopubApi

protocol BookmarksViewModelable: ObservableObject {
    var items: [BookmarkFolder] { get }
    var isLoading: Bool { get }
    var isError: Bool { get }
    func fetchData() async
}
