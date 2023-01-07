//
//  ProfileViewModel.swift
//  kinopub
//
//  Created by Andrzej Wielski on 01.01.2023.
//

import Foundation
import KinopubApi

class UserViewModel: ObservableObject {
    @Published private(set) var username: String?
    @Published private(set) var profile: UserProfile?
    @Published private(set) var subscription: UserSubscription?

    var onError: ((Error) -> Void)?

    init() {
        Task.init {
            await fetchData()
        }
    }

    func fetchData() async {
        KinopubDefaultAPI.getCurrentUser() { response, error in
            guard error == nil else {
                self.onError?(error!)
                return
            }

            if (response != nil) {
                self.username = response?.user?.username
                self.profile = response?.user?.profile
                self.subscription = response?.user?.subscription
            }
        }
    }
}
