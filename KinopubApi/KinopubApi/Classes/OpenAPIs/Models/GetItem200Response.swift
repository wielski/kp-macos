//
// GetItem200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetItem200Response: Codable, JSONEncodable, Hashable {

    public var item: FullItem?

    public init(item: FullItem? = nil) {
        self.item = item
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case item
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(item, forKey: .item)
    }
}
