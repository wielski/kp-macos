//
//  ItemView.swift
//  kinopub
//
//  Created by Andrzej Wielski on 02.01.2023.
//

import SwiftUI
import SwiftUIRouter
import KinopubApi
import Shiny
import NukeUI

struct WideItemView: View {
    @EnvironmentObject var navigator: Navigator

    var item: ItemInfo
    var onClick: (() -> Void)?

    @State var isHovered: Bool = false

    let debouncer = Debouncer(timeInterval: 0.3)

    var body: some View {
        VStack(alignment: .leading) {
            WideItemImageView(
                imageUrl: item.posters?.wide ?? item.posters?.medium ?? "",
                hovered: $isHovered
            )

            Text(item.title ?? "")
                .lineLimit(1)

            Text(String(item.year ?? 0))
                .foregroundColor(.secondary)
        }
        .frame(width: 300)
        .onHover() { over in
            setHover(hover: over)
        }
        .onTapGesture {
            if let onClick = onClick {
                onClick()
            } else if let id = item.id {
                navigator.navigate("/Item/\(id)")
            }
        }
    }

    func setHover(hover: Bool) {
        debouncer.renewInterval()
        debouncer.handler = {
            isHovered = hover
        }
    }
}

struct WideItemImageView: View {
    var imageUrl: String
    @Binding var hovered: Bool

    var body: some View {
        ZStack {
            LazyImage(url: URL(string: imageUrl))
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .cornerRadius(8)
                .background(Color(NSColor.separatorColor))
                .frame(width: 300, height: 180)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .continuous
                    )
                )

            // TODO: Make average color gradient, and place title over it
            Rectangle()
                .shiny(.iridescent)
                .mask(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .top))
                .frame(width: 300, height: 180)
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .continuous
                    )
                )
                .opacity(hovered ? 0.5 : 0.0)
                .animation(.linear, value: hovered)
        }
    }
}

struct WideItemView_Previews: PreviewProvider {
    static var previews: some View {
        WideItemView(
            item: mockItem
        )
    }
}
