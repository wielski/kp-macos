//
// BookmarkFolder.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct BookmarkFolder: Codable, JSONEncodable, Hashable {

    public var id: Int64?
    public var title: String?
    public var views: Int64?
    public var count: String?
    public var created: Int64?
    public var updated: Int64?

    public init(id: Int64? = nil, title: String? = nil, views: Int64? = nil, count: String? = nil, created: Int64? = nil, updated: Int64? = nil) {
        self.id = id
        self.title = title
        self.views = views
        self.count = count
        self.created = created
        self.updated = updated
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case title
        case views
        case count
        case created
        case updated
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(views, forKey: .views)
        try container.encodeIfPresent(count, forKey: .count)
        try container.encodeIfPresent(created, forKey: .created)
        try container.encodeIfPresent(updated, forKey: .updated)
    }
}

