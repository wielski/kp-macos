//
// GetItemsByFilter200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetItemsByFilter200Response: Codable, JSONEncodable, Hashable {

    public var items: [ItemInfo]?
    public var pagination: Pagination?

    public init(items: [ItemInfo]? = nil, pagination: Pagination? = nil) {
        self.items = items
        self.pagination = pagination
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case items
        case pagination
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(items, forKey: .items)
        try container.encodeIfPresent(pagination, forKey: .pagination)
    }
}

