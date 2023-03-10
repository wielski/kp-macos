//
// VoiceoverType.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct VoiceoverType: Codable, JSONEncodable, Hashable {

    public var id: Int64?
    public var title: String?
    public var shortTitle: String?

    public init(id: Int64? = nil, title: String? = nil, shortTitle: String? = nil) {
        self.id = id
        self.title = title
        self.shortTitle = shortTitle
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case title
        case shortTitle = "short_title"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(shortTitle, forKey: .shortTitle)
    }
}

