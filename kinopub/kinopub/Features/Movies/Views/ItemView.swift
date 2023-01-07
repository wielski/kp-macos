//
//  ItemView.swift
//  kinopub
//
//  Created by Andrzej Wielski on 02.01.2023.
//

import SwiftUI
import KinopubApi
import NukeUI

struct ItemView: View {
    var item: ItemInfo

    var body: some View {
        // FIXME: everything is optionable, make it work without any field
        VStack(alignment: .leading) {
            ItemImageView(
                imageUrl: item.posters?.medium ?? "")
                .clipped()
                .cornerRadius(8)
                .frame(width: 192, height: 288)
                .background(Color(NSColor.separatorColor))
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 8,
                        style: .continuous
                    )
                )

            Text(item.title ?? "")
                .lineLimit(1)

            Text(String(item.year ?? 0))
                .foregroundColor(.secondary)
        }
    }
}

struct ItemImageView: View {
    var imageUrl: String
    
    var body: some View {
        LazyImage(
            url: URL(string: imageUrl.replacingOccurrences(of: "http://", with: "https://"))
        )
            .scaledToFit()
            .aspectRatio(contentMode: .fill)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(
            item: mockItem
        )
    }
}
