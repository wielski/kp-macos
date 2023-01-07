//
// WatchingStatus.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct WatchingStatus: Codable, JSONEncodable, Hashable {

    public var status: Status?
    public var time: Int64?

    public init(status: Status? = nil, time: Int64? = nil) {
        self.status = status
        self.time = time
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case time
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(time, forKey: .time)
    }
}
