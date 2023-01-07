//
// Device.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Device: Codable, JSONEncodable, Hashable {

    public var id: Int64?
    public var title: String?
    public var hardware: String?
    public var software: String?
    public var created: Int64?
    public var updated: Int64?
    public var lastSeen: Int64?
    public var isBrowser: Int64?
    public var settings: [String: GetDeviceSettings200ResponseSettingsValue]?

    public init(id: Int64? = nil, title: String? = nil, hardware: String? = nil, software: String? = nil, created: Int64? = nil, updated: Int64? = nil, lastSeen: Int64? = nil, isBrowser: Int64? = nil, settings: [String: GetDeviceSettings200ResponseSettingsValue]? = nil) {
        self.id = id
        self.title = title
        self.hardware = hardware
        self.software = software
        self.created = created
        self.updated = updated
        self.lastSeen = lastSeen
        self.isBrowser = isBrowser
        self.settings = settings
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case title
        case hardware
        case software
        case created
        case updated
        case lastSeen = "last_seen"
        case isBrowser = "is_browser"
        case settings
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(hardware, forKey: .hardware)
        try container.encodeIfPresent(software, forKey: .software)
        try container.encodeIfPresent(created, forKey: .created)
        try container.encodeIfPresent(updated, forKey: .updated)
        try container.encodeIfPresent(lastSeen, forKey: .lastSeen)
        try container.encodeIfPresent(isBrowser, forKey: .isBrowser)
        try container.encodeIfPresent(settings, forKey: .settings)
    }
}

