//
//  UserAuth.swift
//  kinopub
//
//  Created by Andrzej Wielski on 02.01.2023.
//

import Foundation

class UserAuth: ObservableObject {
    @Published var isLoggedin = false

    func login() {
        self.isLoggedin = true
    }

    func logout() {
        AuthenticationKeeper.clearToken()
        self.isLoggedin = false
    }
}
