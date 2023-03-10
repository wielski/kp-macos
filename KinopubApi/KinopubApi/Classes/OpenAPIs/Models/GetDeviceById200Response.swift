//
// GetDeviceById200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetDeviceById200Response: Codable, JSONEncodable, Hashable {

    public var device: Device?

    public init(device: Device? = nil) {
        self.device = device
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case device
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(device, forKey: .device)
    }
}

