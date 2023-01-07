//
//  SwipeBack.swift
//  kinopub
//
//  Created by Andrzej Wielski on 05.01.2023.
//

import SwiftUI
import SwiftUIRouter

struct SwipeableBack: ViewModifier {
    enum Action {
        case back
        case up
    }

    @EnvironmentObject private var navigator: Navigator
    @State private var dragOffset: CGFloat = 0
    
    let action: SwipeableBack.Action
    let threshold: CGFloat
    private let graphicSize: CGFloat = 200

    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                if (action == .back && navigator.canGoBack && value.startLocation.x < 20)
                    || (action == .up && navigator.path != "/" && value.startLocation.x < 20)
                {
                    dragOffset = value.translation.width * 0.2
                }
            }
            .onEnded { value in
                if dragOffset > threshold {
                    if action == .back {
                        navigator.goBack()
                    }
                    else if action == .up {
                        navigator.navigate("..")
                    }
                }
                
                dragOffset = 0
            }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                ZStack(alignment: .trailing) {
                    Circle()
                        .fill(.black.opacity(dragOffset / threshold))
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                        .padding(.trailing, 10)
                }
                .frame(width: graphicSize, height: graphicSize)
                .offset(x: min(max(0, dragOffset), graphicSize / 2) - graphicSize),
                alignment: .leading
            )
            .clipped()
            .gesture(dragGesture)
    }
}

extension View {
    func swipeableBack(action: SwipeableBack.Action = .back, threshold: CGFloat = 40) -> some View {
        modifier(SwipeableBack(action: action, threshold: threshold))
    }
}
