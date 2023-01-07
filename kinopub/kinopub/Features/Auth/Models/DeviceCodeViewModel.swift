//
//  DeviceCode.swift
//  kinopub
//
//  Created by Andrzej Wielski on 31.12.2022.
//

import Foundation
import KinopubAuth

protocol DeviceCodeViewModelable: ObservableObject {
    var code: String { get }
    var userCode: String { get }
    var url: String { get }
    var seconds: Int { get }
    var isLoading: Bool { get }
    var errorMessage: String { get }
    func getCode()
    func checkForAuth(interval: Int)
}

class DeviceCodeViewModel: DeviceCodeViewModelable {
    @Published var code: String = ""
    @Published var userCode: String = ""
    @Published var url: String = ""
    @Published var seconds: Int = 0
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""

    var checkCodeWorker: DispatchWorkItem?
    var onLogin: (() -> Void)?

    init() {
        Task.init {
            getCode()
        }
    }

    func getCode() {
        self.isLoading = true

        let getDeviceCode = GetDeviceCode(
            grantType: GetDeviceCode.GrantType.deviceCode,
            clientId: ClientId,
            clientSecret: ClientSecret
        )

        KinopubAuthDefaultAPI.getDeviceCode(getDeviceCode: getDeviceCode) { (response, error) in
            self.isLoading = false

            guard error == nil else {
                self.errorMessage = "Не удалось получить код"
                return
            }

            if let deviceCodeResponse = response {
                self.code = deviceCodeResponse.code ?? ""
                self.userCode = deviceCodeResponse.userCode ?? ""
                self.url = deviceCodeResponse.verificationUri ?? ""
                self.seconds = Int(deviceCodeResponse.expiresIn ?? 0)

                self.checkForAuth(interval: Int(deviceCodeResponse.interval ?? 5))

                let dispatchAfter = DispatchTimeInterval.seconds(self.seconds)
                DispatchQueue.main.asyncAfter(
                    deadline: .now() + dispatchAfter,
                    execute: self.getCode
                )
            }
        }
    }
    
    func checkForAuth(interval: Int) {
        if let checkCodeWorker = checkCodeWorker {
            checkCodeWorker.cancel();
        }

        checkCodeWorker = DispatchWorkItem(block: {
            let getAccessToken = GetAccessToken(
                grantType: GetAccessToken.GrantType.deviceToken,
                code: self.code,
                clientId: ClientId,
                clientSecret: ClientSecret
            )

            KinopubAuthDefaultAPI.getAccessToken(getAccessToken: getAccessToken) { (response, error) in
                guard let error = error else {
                    AuthenticationKeeper.saveToken(
                        token: response?.accessToken ?? "",
                        refreshToken: response?.refreshToken ?? "",
                        expiresIn: Int(response?.expiresIn ?? 0)
                    )
                    self.onLogin?()
                    return
                }

                let authError = error.authErrorResponse

                if let authError = authError {
                    if (authError.error == "authorization_pending") {
                        // Check again
                        self.checkForAuth(interval: interval);
                    } else {
                        // TODO: Show error
                    }
                }
            }
        })

        let dispatchAfter = DispatchTimeInterval.seconds(interval)
        DispatchQueue.main.asyncAfter(
            deadline: .now() + dispatchAfter,
            execute: checkCodeWorker!
        )
    }
}

extension Error {
    var authErrorResponse: AuthError? {
        guard let errorResponse = self as? ErrorResponse else { return nil }
        switch errorResponse {
        case let .error(_, data, _, _):
            if let data = data, let authErrorResponse = try? JSONDecoder().decode(AuthError.self, from: data) {
                return authErrorResponse
            }
        }
        return nil
    }
}
