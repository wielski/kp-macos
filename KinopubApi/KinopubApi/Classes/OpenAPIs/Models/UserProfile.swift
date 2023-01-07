//
// UserProfile.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UserProfile: Codable, JSONEncodable, Hashable {

    public var name: String?
    public var avatar: String?

    public init(name: String? = nil, avatar: String? = nil) {
        self.name = name
        self.avatar = avatar
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case avatar
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(avatar, forKey: .avatar)
    }
}
