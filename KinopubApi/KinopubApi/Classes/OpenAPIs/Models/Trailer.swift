//
// Trailer.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Trailer: Codable, JSONEncodable, Hashable {

    public var id: Int64?
    public var url: String?
    public var files: [TrailerFilesInner]?

    public init(id: Int64? = nil, url: String? = nil, files: [TrailerFilesInner]? = nil) {
        self.id = id
        self.url = url
        self.files = files
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case url
        case files
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(files, forKey: .files)
    }
}

