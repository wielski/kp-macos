//
// AuthDeviceCode.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AuthDeviceCode: Codable, JSONEncodable, Hashable {

    public var code: String?
    public var userCode: String?
    public var verificationUri: String?
    public var expiresIn: Int64?
    public var interval: Int64?

    public init(code: String? = nil, userCode: String? = nil, verificationUri: String? = nil, expiresIn: Int64? = nil, interval: Int64? = nil) {
        self.code = code
        self.userCode = userCode
        self.verificationUri = verificationUri
        self.expiresIn = expiresIn
        self.interval = interval
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case userCode = "user_code"
        case verificationUri = "verification_uri"
        case expiresIn = "expires_in"
        case interval
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(userCode, forKey: .userCode)
        try container.encodeIfPresent(verificationUri, forKey: .verificationUri)
        try container.encodeIfPresent(expiresIn, forKey: .expiresIn)
        try container.encodeIfPresent(interval, forKey: .interval)
    }
}

