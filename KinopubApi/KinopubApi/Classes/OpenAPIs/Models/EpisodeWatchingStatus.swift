//
// EpisodeWatchingStatus.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct EpisodeWatchingStatus: Codable, JSONEncodable, Hashable {

    public var id: Int64?
    public var number: Int64?
    public var title: String?
    public var duration: Float?
    public var status: Status?
    public var time: Float?
    public var updated: Int64?

    public init(id: Int64? = nil, number: Int64? = nil, title: String? = nil, duration: Float? = nil, status: Status? = nil, time: Float? = nil, updated: Int64? = nil) {
        self.id = id
        self.number = number
        self.title = title
        self.duration = duration
        self.status = status
        self.time = time
        self.updated = updated
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case number
        case title
        case duration
        case status
        case time
        case updated
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(number, forKey: .number)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(time, forKey: .time)
        try container.encodeIfPresent(updated, forKey: .updated)
    }
}

