//
//  ColorByString.swift
//  kinopub
//
//  Created by Andrzej Wielski on 07.01.2023.
//

import Foundation
import SwiftUI

extension Color {
    public static func generateColorFor(text: String) -> Color {
        var hash = 0
        let colorConstant = 131
        let maxSafeValue = Int.max / colorConstant
        for char in text.unicodeScalars{
            if hash > maxSafeValue {
                hash = hash / colorConstant
            }
            hash = Int(char.value) + ((hash << 5) - hash)
        }
        let finalHash = abs(hash) % (256*256*256);
        //let color = NSColor(hue:CGFloat(finalHash)/255.0 , saturation: 0.40, brightness: 0.75, alpha: 1.0)
        let color = Color(red: CGFloat((finalHash & 0xFF0000) >> 16) / 255.0, green: CGFloat((finalHash & 0xFF00) >> 8) / 255.0, blue: CGFloat((finalHash & 0xFF)) / 255.0)
        print(color)
        return color
    }
}
