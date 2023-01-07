//
//  BookmarksViewModel.swift
//  kinopub
//
//  Created by Andrzej Wielski on 07.01.2023.
//

import Foundation
import KinopubApi

class BookmarksViewModel: BookmarksViewModelable {
    @Published private(set) var items: [BookmarkFolder] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var isError: Bool = false

    var onError: ((Error) -> Void)?

    init() {
        Task.init {
            await fetchData()
        }
    }

    func fetchData() async {
        DispatchQueue.main.async {
            self.isError = false
            self.isLoading = true
        }

        KinopubDefaultAPI.getBookmarkFolders() { response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                self.isError = false

                guard error == nil else {
                    self.isError = true
                    self.onError?(error!)
                    return
                }

                if (response != nil) {
                    self.items = response?.items ?? []
                }
            }
        }
    }
}
