//
// MovieItemAllOf.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MovieItemAllOf: Codable, JSONEncodable, Hashable {

    public var videos: [Video]

    public init(videos: [Video]) {
        self.videos = videos
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case videos
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(videos, forKey: .videos)
    }
}

