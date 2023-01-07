//
//  HotMoviesViewModel.swift
//  kinopub
//
//  Created by Andrzej Wielski on 03.01.2023.
//

import Foundation
import KinopubApi

class HotViewModel: WhatToWatchViewModelable {
    @Published private(set) var items: [ItemInfo] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var isError: Bool = false

    var type: String
    var onError: ((Error) -> Void)?

    init(type: String) {
        self.type = type
        Task.init {
            await fetchData()
        }
    }

    func fetchData() async {
        DispatchQueue.main.async {
            self.isError = false
            self.isLoading = true
        }

        KinopubDefaultAPI.getHotItems(
            type: [type],
            perpage: 10,
            page: 1
        ) { response, error in
            DispatchQueue.main.async {
                self.isLoading = false

                guard error == nil else {
                    self.isError = true
                    self.onError?(error!)
                    print(error)
                    return
                }

                if (response != nil) {
                    self.items = response?.items ?? []
                }
            }
        }
    }
}
