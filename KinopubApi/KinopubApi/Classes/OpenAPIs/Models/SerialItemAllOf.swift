//
// SerialItemAllOf.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SerialItemAllOf: Codable, JSONEncodable, Hashable {

    public var seasons: [Season]

    public init(seasons: [Season]) {
        self.seasons = seasons
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case seasons
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(seasons, forKey: .seasons)
    }
}

