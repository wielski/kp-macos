//
// TVChannelLogos.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TVChannelLogos: Codable, JSONEncodable, Hashable {

    public var s: String?

    public init(s: String? = nil) {
        self.s = s
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case s
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(s, forKey: .s)
    }
}

