//
//  PopularMoviesViewModel.swift
//  kinopub
//
//  Created by Andrzej Wielski on 02.01.2023.
//

import Foundation
import KinopubApi

class PopularViewModel: WhatToWatchViewModelable {
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

        KinopubDefaultAPI.getPopularItems(
            type: [type],
            perpage: 10,
            page: 1
        ) { response, error in
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
