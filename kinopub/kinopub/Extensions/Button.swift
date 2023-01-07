//
//  Button.swift
//  kinopub
//
//  Created by Andrzej Wielski on 04.01.2023.
//

import SwiftUI

enum MyButtonStyle {
    case `default`
    case bordered
    case borderless
    case more
}

extension Button {
    @ViewBuilder
    func withStyle(_ style: MyButtonStyle) -> some View {
        switch style {
            case .default:
                self.buttonStyle(DefaultButtonStyle())
            case .bordered:
                self.buttonStyle(BorderedButtonStyle())
            case .borderless:
                self.buttonStyle(BorderlessButtonStyle())
            case .more:
                self.buttonStyle(MoreButtonStyle())
        }
    }
}

struct MoreButtonStyle: ButtonStyle {
    @State var isHovered = false
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .colorMultiply(
                    isHovered ? .primary : configuration.isPressed ? Color.clear.opacity(0.5) : .secondary
                )
                .animation(.linear, value: isHovered)
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 8)
        .background(
            isHovered ? Color.gray.opacity(0.15) : .clear
        )
        .animation(.linear, value: isHovered)
        .cornerRadius(8)
        .onHover() { over in
            isHovered = over
        }
//        .overlay(
//            RoundedRectangle(cornerRadius: 8)
//        )
     }
}
