//
// GetHistory200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetHistory200Response: Codable, JSONEncodable, Hashable {

    public var history: [HistoryItem]?
    public var pagination: Pagination?

    public init(history: [HistoryItem]? = nil, pagination: Pagination? = nil) {
        self.history = history
        self.pagination = pagination
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case history
        case pagination
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(history, forKey: .history)
        try container.encodeIfPresent(pagination, forKey: .pagination)
    }
}

