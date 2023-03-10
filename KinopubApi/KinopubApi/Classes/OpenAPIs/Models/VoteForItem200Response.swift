//
// VoteForItem200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct VoteForItem200Response: Codable, JSONEncodable, Hashable {

    public var voted: Bool?
    public var total: String?
    public var positive: String?
    public var negative: String?
    public var rating: Int64?

    public init(voted: Bool? = nil, total: String? = nil, positive: String? = nil, negative: String? = nil, rating: Int64? = nil) {
        self.voted = voted
        self.total = total
        self.positive = positive
        self.negative = negative
        self.rating = rating
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case voted
        case total
        case positive
        case negative
        case rating
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(voted, forKey: .voted)
        try container.encodeIfPresent(total, forKey: .total)
        try container.encodeIfPresent(positive, forKey: .positive)
        try container.encodeIfPresent(negative, forKey: .negative)
        try container.encodeIfPresent(rating, forKey: .rating)
    }
}

