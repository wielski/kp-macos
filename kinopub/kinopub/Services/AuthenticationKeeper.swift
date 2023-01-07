//
//  AuthenticationKeeper.swift
//  kinopub
//
//  Created by Andrzej Wielski on 31.12.2022.
//

import Foundation
import KinopubAuth

struct AuthenticationKeeper {
    static func saveToken(token: String, refreshToken: String, expiresIn: Int) {
        let defaults = UserDefaults.standard
        defaults.set(token, forKey: "access_token")
        defaults.set(refreshToken, forKey: "refresh_token")
        defaults.set(Date().addingTimeInterval(TimeInterval(expiresIn)), forKey: "expires_at")
    }

    static func getToken() -> String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: "access_token")
    }
    
    static func getRefreshToken() -> String? {
        let defaults = UserDefaults.standard
        return defaults.string(forKey: "refresh_token")
    }

    static func getExpiresAt() -> Date? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "expires_at") as? Date
    }

    static func clearToken() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "access_token")
        defaults.removeObject(forKey: "refresh_token")
        defaults.removeObject(forKey: "expires_at")
    }

    static func refreshToken(completion: ((_ token: String?, _ error: Error?) -> Void)? = nil) {
        let refreshToken = AuthenticationKeeper.getRefreshToken()
        if let refreshToken = refreshToken {
            let refreshAccessToken = RefreshAccessToken(
                grantType: RefreshAccessToken.GrantType.refreshToken,
                refreshToken: refreshToken,
                clientId: ClientId,
                clientSecret: ClientSecret
            )

            KinopubAuthDefaultAPI.refreshAccessToken(refreshAccessToken: refreshAccessToken) { (response, error) in
                guard let error = error else {
                    AuthenticationKeeper.saveToken(
                        token: response?.accessToken ?? "",
                        refreshToken: response?.refreshToken ?? "",
                        expiresIn: Int(response?.expiresIn ?? 0)
                    )
                    return
                }

                clearToken()
                completion?(nil, error)
            }
        }
    }
}
