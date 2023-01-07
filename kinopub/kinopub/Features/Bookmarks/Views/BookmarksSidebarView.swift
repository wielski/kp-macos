//
//  BookmarksSidebarView.swift
//  kinopub
//
//  Created by Andrzej Wielski on 07.01.2023.
//

import Foundation
import SwiftUI
import KinopubApi

struct BookmarksSidebarView: View {
    @StateObject var bookmarksModel = BookmarksViewModel()

    var body: some View {
        BookmarksSidebarViewInternal(
            bookmarks: bookmarksModel
        )
    }
}

struct BookmarksSidebarViewInternal<ViewModel: BookmarksViewModelable>: View {
    @ObservedObject var bookmarks: ViewModel

    var body: some View {
        ForEach(bookmarks.items, id: \.id) { bookmark in
            Label(bookmark.title ?? "", systemImage: "circle.fill")
                .tag("/Bookmark/\(bookmark.id!)")
                .tint(Color.generateColorFor(text: bookmark.title ?? ""))
        }
    }
}

// Preview

class PreviewBookmarksViewModel: BookmarksViewModelable {
    @Published var items: [BookmarkFolder] = [
        BookmarkFolder(id: 1, title: "Закладка 1"),
        BookmarkFolder(id: 2, title: "Закладка 2"),
        BookmarkFolder(id: 3, title: "Movies"),
        BookmarkFolder(id: 4, title: "Надо посмотреть"),
        BookmarkFolder(id: 5, title: "Корейские дорамы"),
        BookmarkFolder(id: 6, title: "Фильмы с невским"),
    ];
    @Published var isError = true;
    @Published var isLoading = false;

    func fetchData() {} // do nothing while in a Preview
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksSidebarViewInternal(
            bookmarks: PreviewBookmarksViewModel()
        )
    }
}
