//
// Posters.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Posters: Codable, JSONEncodable, Hashable {

    public var small: String?
    public var medium: String?
    public var big: String?
    public var wide: String?

    public init(small: String? = nil, medium: String? = nil, big: String? = nil, wide: String? = nil) {
        self.small = small
        self.medium = medium
        self.big = big
        self.wide = wide
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case small
        case medium
        case big
        case wide
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(small, forKey: .small)
        try container.encodeIfPresent(medium, forKey: .medium)
        try container.encodeIfPresent(big, forKey: .big)
        try container.encodeIfPresent(wide, forKey: .wide)
    }
}

