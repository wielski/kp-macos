//
// ContentType.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ContentType: Codable, JSONEncodable, Hashable {

    public var id: String?
    public var title: String?

    public init(id: String? = nil, title: String? = nil) {
        self.id = id
        self.title = title
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case title
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(title, forKey: .title)
    }
}

