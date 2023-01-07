//
//  SidebarView.swift
//  kinopub
//
//  Created by Andrzej Wielski on 03.01.2023.
//

import SwiftUI
import SwiftUIRouter

struct Navigation: View {
    var body: some View {
        Label("Что посмотреть", systemImage: "play")
            .tag("")
            .tint(.orange)
        Label("Фильмы", systemImage: "film")
            .tag("Movies")
            .tint(.orange)
        Label("Сериалы", systemImage: "tv")
            .tag("Serials")
            .tint(.orange)
        Label("Концерты", systemImage: "music.note.tv")
            .tag("Concerts")
            .tint(.orange)
        Label("Документальные фильмы", systemImage: "film.stack")
            .tag("Documovies")
            .tint(.orange)
        Label("Документальные сериалы", systemImage: "photo.tv")
            .tag("Docuserials")
            .tint(.orange)
        Label("ТВ Шоу", systemImage: "sparkles.tv")
            .tag("TVShows")
            .tint(.orange)
    }
}

struct Bookmarks: View {
    var body: some View {
        Text("Закладки")
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.secondary)

        BookmarksSidebarView()
    }
}

struct SidebarView: View {
    @EnvironmentObject var navigator: Navigator
    @State var selection: String? = ""

    var body: some View {
        List(selection: self.$selection) {
            Navigation()
            Divider()

//            Group {
//                Text("Collection")
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.secondary)
//                Text("Favorites")
//                Text("Downloads")
//            }
//            Divider()

            Bookmarks()
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 192, idealWidth: 192, maxWidth: 256, maxHeight: .infinity)
        .onChange(of: selection) { newSelected in
            let pathComponents = navigator.path.components(separatedBy: "/").dropFirst()
            let newPath = pathComponents.joined(separator: "/")
            if newSelected != newPath {
                navigator.navigate("/" + (newSelected ?? ""))
            }
        }
        .onChange(of: navigator.path) { newPath in
            let components = newPath.components(separatedBy: "/").dropFirst()
            let path = components.joined(separator: "/")
            if selection != path {
                selection = path
            }
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
