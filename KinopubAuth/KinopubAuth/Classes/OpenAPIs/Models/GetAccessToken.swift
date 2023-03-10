//
// GetAccessToken.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetAccessToken: Codable, JSONEncodable, Hashable {

    public enum GrantType: String, Codable, CaseIterable {
        case deviceToken = "device_token"
    }
    public var grantType: GrantType?
    public var code: String?
    public var clientId: String?
    public var clientSecret: String?

    public init(grantType: GrantType? = nil, code: String? = nil, clientId: String? = nil, clientSecret: String? = nil) {
        self.grantType = grantType
        self.code = code
        self.clientId = clientId
        self.clientSecret = clientSecret
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case grantType = "grant_type"
        case code
        case clientId = "client_id"
        case clientSecret = "client_secret"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(grantType, forKey: .grantType)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(clientId, forKey: .clientId)
        try container.encodeIfPresent(clientSecret, forKey: .clientSecret)
    }
}

