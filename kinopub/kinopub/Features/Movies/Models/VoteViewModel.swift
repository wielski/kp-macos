//
//  VoteViewModel.swift
//  kinopub
//
//  Created by Andrzej Wielski on 07.01.2023.
//

import Foundation
import KinopubApi

class VoteViewModel: VoteViewModelable {
    @Published private(set) var liked: Bool?
    @Published private(set) var voted: Bool?
    @Published private(set) var total: String?
    @Published private(set) var positive: String?
    @Published private(set) var negative: String?
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var isError: Bool = false

    var onError: ((Error) -> Void)?

    func voteFor(id: Int, like: Bool) async {
        DispatchQueue.main.async {
            self.liked = nil
            self.voted = nil
            self.total = nil
            self.positive = nil
            self.negative = nil
            self.isError = false
            self.isLoading = true
        }

        KinopubDefaultAPI.voteForItem(
            id: Int64(id),
            like: like ? ._1 : ._0
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
                    self.liked = like
                    self.voted = response.voted
                    self.total = response.total
                    self.positive = response.positive
                    self.negative = response.negative
                }
            }
        }
    }
}
