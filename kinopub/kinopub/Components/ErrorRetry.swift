//
//  ErrorRetry.swift
//  kinopub
//
//  Created by Andrzej Wielski on 05.01.2023.
//

import SwiftUI

struct ErrorRetry: View {
    var onRetry: (() -> Void)?

    init(onRetry: (() -> Void)? = nil) {
        self.onRetry = onRetry
    }

    var body: some View {
        VStack {
            Text("Произошла ошибка при загрузке данных")

            if let onRetry = onRetry {
                Button(action: {
                    onRetry()
                }) {
                    Image(systemName: "arrow.clockwise.circle.fill")
                    Text("Повторить")
                }
                .buttonStyle(.link)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(8)
    }
}

struct ErrorRetry_Previews: PreviewProvider {
    static var previews: some View {
        ErrorRetry() {
            print("retry")
        }
    }
}
