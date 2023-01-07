//
//  LongText.swift
//  kinopub
//
//  Created by Andrzej Wielski on 04.01.2023.
//

import SwiftUI

struct LongText: View {
    @State private var expanded: Bool = false
    @State private var truncated: Bool = false
    @State private var shouldPresentSheet = false

    private var text: String
    private var showInSheet: Bool = false
    private var sheetTitle: String?

    init(_ text: String, inSheet: Bool = false, sheetTitle: String? = nil) {
        self.text = text
        self.showInSheet = inSheet
        self.sheetTitle = sheetTitle
    }

    private func determineTruncation(_ geometry: GeometryProxy) {
        let total = self.text.boundingRect(
            with: CGSize(
                width: geometry.size.width,
                height: .greatestFiniteMagnitude
            ),
            options: .usesLineFragmentOrigin,
            attributes: [.font: NSFont.systemFont(ofSize: 16)],
            context: nil
        )

        if total.size.height > geometry.size.height {
            self.truncated = true
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(self.text)
                .font(.system(size: 16))
                .lineLimit(self.expanded ? nil : 3)
                .background(GeometryReader { geometry in
                    Color.clear.onAppear {
                        self.determineTruncation(geometry)
                    }
                })

            if self.truncated {
                self.toggleButton
            }
        }
    }

    var toggleButton: some View {
        Group {
            switch (self.showInSheet) {
            case true:
                Button(action: { self.shouldPresentSheet.toggle() }) {
                    Text("еще")
                        .font(.caption)
                }
                .sheet(isPresented: $shouldPresentSheet) {
                    shouldPresentSheet = false
                } content: {
                    LongTextSheetView(
                        text: self.text,
                        title: self.sheetTitle
                    )
                }
            case false:
                Button(action: { self.expanded.toggle() }) {
                    Text(self.expanded ? "скрыть" : "еще")
                        .font(.caption)
                }
            }
        }
    }
}

struct LongTextSheetView: View {
    @Environment(\.dismiss) private var dismiss

    var text: String
    var title: String?

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Text(title ?? "")
                Spacer()
                Button("Готово") {
                    dismiss()
                }
                .buttonStyle(.link)
                .font(.body)
                .foregroundColor(.primary)
            }
            .padding(.all, 10)
            .background(.black.opacity(0.1))
            
            Divider()
            
            ScrollView(.vertical) {
                Text(text)
            }
            .padding(.all, 20)
        }
        .frame(minWidth: 300, maxWidth: 600, minHeight: 400)
    }
}
