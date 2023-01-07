//
// File.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct File: Codable, JSONEncodable, Hashable {

    public var codec: String?
    public var w: Int?
    public var h: Int?
    public var quality: String?
    public var qualityId: Int64?
    public var file: String?
    public var url: FileUrl?

    public init(codec: String? = nil, w: Int? = nil, h: Int? = nil, quality: String? = nil, qualityId: Int64? = nil, file: String? = nil, url: FileUrl? = nil) {
        self.codec = codec
        self.w = w
        self.h = h
        self.quality = quality
        self.qualityId = qualityId
        self.file = file
        self.url = url
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case codec
        case w
        case h
        case quality
        case qualityId = "quality_id"
        case file
        case url
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(codec, forKey: .codec)
        try container.encodeIfPresent(w, forKey: .w)
        try container.encodeIfPresent(h, forKey: .h)
        try container.encodeIfPresent(quality, forKey: .quality)
        try container.encodeIfPresent(qualityId, forKey: .qualityId)
        try container.encodeIfPresent(file, forKey: .file)
        try container.encodeIfPresent(url, forKey: .url)
    }
}
