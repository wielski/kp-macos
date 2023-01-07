//
// CommentUser.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CommentUser: Codable, JSONEncodable, Hashable {

    public var id: Int64?
    public var name: String?
    public var avatar: String?

    public init(id: Int64? = nil, name: String? = nil, avatar: String? = nil) {
        self.id = id
        self.name = name
        self.avatar = avatar
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case avatar
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(avatar, forKey: .avatar)
    }
}

