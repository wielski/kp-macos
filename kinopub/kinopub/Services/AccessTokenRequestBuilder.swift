//
//  AccessTokenRequestBuilder.swift
//  kinopub
//
//  Created by Andrzej Wielski on 02.01.2023.
//

import Foundation
import KinopubApi

class AccessTokenRequestBuilderFactory: RequestBuilderFactory {
    func getNonDecodableBuilder<T>() -> RequestBuilder<T>.Type {
        AccessTokenRequestBuilder<T>.self
    }

    func getBuilder<T: Decodable>() -> RequestBuilder<T>.Type {
        AccessTokenDecodableRequestBuilder<T>.self
    }
}

class AccessTokenRequestBuilder<T>: URLSessionRequestBuilder<T> {
    override func createURLRequest(urlSession: URLSessionProtocol, method: HTTPMethod, encoding: ParameterEncoding, headers: [String: String]) throws -> URLRequest {
        // if authentication is not required - skip
        guard self.requiresAuthentication else {
            return try super.createURLRequest(
                urlSession: urlSession,
                method: method,
                encoding: encoding,
                headers: headers
            )
        }

        guard var urlComponents = URLComponents(string: URLString) else {
            throw DownloadException.requestMissingURL
        }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        // add access token to URL
        let accessToken = AuthenticationKeeper.getToken()
        if accessToken != nil {
            let queryItem = URLQueryItem(name: "access_token", value: accessToken)
            queryItems.append(queryItem)
            urlComponents.queryItems = queryItems
        }

        var originalRequest = URLRequest(url: urlComponents.url!)

        originalRequest.httpMethod = method.rawValue

        headers.forEach { key, value in
            originalRequest.setValue(value, forHTTPHeaderField: key)
        }

        buildHeaders().forEach { key, value in
            originalRequest.setValue(value, forHTTPHeaderField: key)
        }

        let modifiedRequest = try encoding.encode(originalRequest, with: parameters)

        return modifiedRequest
    }
    
    @discardableResult
    override func execute(_ apiResponseQueue: DispatchQueue = KinopubApiAPI.apiResponseQueue, _ completion: @escaping (Result<Response<T>, ErrorResponse>) -> Void) -> RequestTask {

        guard self.requiresAuthentication else {
            return super.execute(apiResponseQueue, completion)
        }

        // Here we make the request
        super.execute(apiResponseQueue) { result in
            
            switch result {
            case .success:
                // If we got a successful response, we send the response to the completion block
                completion(result)
                
            case let .failure(error):
                
                // If we got a failure response, we will analyse the error to see what we should do with it
                if case let ErrorResponse.error(_, data, response, error) = error {
                    
                    // If the error is an ErrorResponse.error() we will analyse it to see if it's a 401, and if it's a 401, we will refresh the token and retry the request
                    AccessTokenTokenHandler.refreshTokenIfUnauthorizedRequestResponse(
                        data: data,
                        response: response,
                        error: error
                    ) { (wasTokenRefreshed, newToken) in
                        if wasTokenRefreshed {
                            // Token was refreshed - retry
                            self.execute(apiResponseQueue, completion)
                        } else {
                            // If the token was not refreshed, it's because it was not a 401 error, so we send the response to the completion block
                            completion(result)
                        }
                    }
                } else {
                    // If it's an unknown error, we send the response to the completion block
                    completion(result)
                }
            }
        }
        
        return requestTask
    }
}

class AccessTokenDecodableRequestBuilder<T: Decodable>: URLSessionDecodableRequestBuilder<T> {
    override func createURLRequest(urlSession: URLSessionProtocol, method: HTTPMethod, encoding: ParameterEncoding, headers: [String: String]) throws -> URLRequest {
        // if authentication is not required - skip
        guard self.requiresAuthentication else {
            return try super.createURLRequest(
                urlSession: urlSession,
                method: method,
                encoding: encoding,
                headers: headers
            )
        }

        guard var urlComponents = URLComponents(string: URLString) else {
            throw DownloadException.requestMissingURL
        }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []

        // add access token to URL
        let accessToken = AuthenticationKeeper.getToken()
        if accessToken != nil {
            let queryItem = URLQueryItem(name: "access_token", value: accessToken)
            queryItems.append(queryItem)
            urlComponents.queryItems = queryItems
        }

        var originalRequest = URLRequest(url: urlComponents.url!)

        originalRequest.httpMethod = method.rawValue

        headers.forEach { key, value in
            originalRequest.setValue(value, forHTTPHeaderField: key)
        }

        buildHeaders().forEach { key, value in
            originalRequest.setValue(value, forHTTPHeaderField: key)
        }

        let modifiedRequest = try encoding.encode(originalRequest, with: parameters)

        return modifiedRequest
    }

    @discardableResult
    override func execute(_ apiResponseQueue: DispatchQueue = KinopubApiAPI.apiResponseQueue, _ completion: @escaping (Result<Response<T>, ErrorResponse>) -> Void) -> RequestTask {
        
        guard self.requiresAuthentication else {
            return super.execute(apiResponseQueue, completion)
        }

        // Here we make the request
        super.execute(apiResponseQueue) { result in
            
            switch result {
            case .success:
                // If we got a successful response, we send the response to the completion block
                completion(result)
                
            case let .failure(error):
                
                // If we got a failure response, we will analyse the error to see what we should do with it
                if case let ErrorResponse.error(_, data, response, error) = error {
                    
                    // If the error is an ErrorResponse.error() we will analyse it to see if it's a 401, and if it's a 401, we will refresh the token and retry the request
                    AccessTokenTokenHandler.refreshTokenIfUnauthorizedRequestResponse(
                        data: data,
                        response: response,
                        error: error
                    ) { (wasTokenRefreshed, newToken) in
                        if wasTokenRefreshed {
                            // Token was refreshed - retry
                            self.execute(apiResponseQueue, completion)
                        } else {
                            // If the token was not refreshed, it's because it was not a 401 error, so we send the response to the completion block
                            completion(result)
                        }
                    }
                } else {
                    // If it's an unknown error, we send the response to the completion block
                    completion(result)
                }
                
            }
        }
        
        return requestTask
    }
}

class AccessTokenTokenHandler {
    private static var AccessTokenToken: String? = nil
    
    static func refreshTokenIfUnauthorizedRequestResponse(data: Data?, response: URLResponse?, error: Error?, completionHandler: @escaping (Bool, String?) -> Void) {
        if let response = response as? HTTPURLResponse, response.statusCode == 401 {
            startRefreshingToken { (token, error) in
                guard error == nil else {
                    completionHandler(false, nil)
                    return
                }

                if token != nil {
                    completionHandler(true, token)
                    return
                }

                completionHandler(false, nil)
            }
        } else {
            completionHandler(false, nil)
        }
    }
    
    private static func startRefreshingToken(completionHandler: @escaping (String?, Error?) -> Void) {
        AuthenticationKeeper.refreshToken() { (token, error) in
            // FIXME: completion is not required?
            guard error == nil else {
                completionHandler(nil, error)
                return
            }

            if token != nil {
                AccessTokenToken = token
                completionHandler(token, nil)
            } else {
                completionHandler(nil, nil)
            }
        }
    }
}
