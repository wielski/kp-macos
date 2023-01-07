//
// UserSubscription.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UserSubscription: Codable, JSONEncodable, Hashable {

    public var active: Bool?
    public var endTime: Int64?
    public var days: Double?

    public init(active: Bool? = nil, endTime: Int64? = nil, days: Double? = nil) {
        self.active = active
        self.endTime = endTime
        self.days = days
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case active
        case endTime = "end_time"
        case days
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(active, forKey: .active)
        try container.encodeIfPresent(endTime, forKey: .endTime)
        try container.encodeIfPresent(days, forKey: .days)
    }
}
