//
// GetDeviceSettings200ResponseSettingsValue.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public enum GetDeviceSettings200ResponseSettingsValue: Codable, JSONEncodable, Hashable {
    case typeCheckboxSetting(CheckboxSetting)
    case typeSelectSetting(SelectSetting)

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .typeCheckboxSetting(let value):
            try container.encode(value)
        case .typeSelectSetting(let value):
            try container.encode(value)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CheckboxSetting.self) {
            self = .typeCheckboxSetting(value)
        } else if let value = try? container.decode(SelectSetting.self) {
            self = .typeSelectSetting(value)
        } else {
            throw DecodingError.typeMismatch(Self.Type.self, .init(codingPath: decoder.codingPath, debugDescription: "Unable to decode instance of GetDeviceSettings200ResponseSettingsValue"))
        }
    }
}
