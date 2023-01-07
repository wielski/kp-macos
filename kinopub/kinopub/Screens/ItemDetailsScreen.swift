//
//  ItemDetailsView.swift
//  kinopub
//
//  Created by Andrzej Wielski on 04.01.2023.
//

import SwiftUI
import KinopubApi

struct ItemDetailsScreen: View {
    var id: Int
    @StateObject var item = ItemDetailsViewModel()
    @State var sidebarWasCollapsed = false
    @EnvironmentObject var sidebarSettings: SidebarSettings

    var body: some View {
        ZStack {
            // TODO: This is too hackish
            Rectangle()
               .hidden()
               .onAppear {
                   if (!sidebarSettings.collapsed) {
                       // Hide sidebar
                       SidebarAccessor.toggleSidebar()
                       sidebarWasCollapsed = true
                   }

                   Task.init {
                       await item.fetchData(id: id)
                   }
               }
               .onDisappear {
                   if (sidebarWasCollapsed && sidebarSettings.collapsed) {
                       // Show sidebar if it was collapsed
                       SidebarAccessor.toggleSidebar()
                   }
               }

            ScrollView(.vertical) {
                ItemDetailsViewInternal(
                    item: item
                )
            }
            .frame(maxWidth: .infinity)

            if (item.isLoading) {
                Spinner(lineWidth: 10.0)
                    .frame(width: 60.0, height: 60.0)
            }

            if item.isError {
                ErrorRetry() {
                    Task.init {
                        await item.fetchData(id: id)
                    }
                }
            }
        }
        .presentedWindowToolbarStyle(.expanded)
    }
}

struct ItemDetailsViewInternal<ViewModel: ItemDetailsViewModelable>: View {
    @ObservedObject var item: ViewModel

    var body: some View {
        Group {
            if let movie = item.movie {
                MovieDetailsView(
                    movie: movie,
                    nextVideo: item.nextVideo
                )
                .navigationTitle(movie.title ?? "")
                .navigationSubtitle("Фильм")
            } else if let serial = item.serial {
                SerialDetailsView(
                    serial: serial,
                    nextVideo: item.nextVideo,
                    onToggleWatchlist: item.toggleWatchList
                )
                .navigationTitle(serial.title ?? "")
                .navigationSubtitle("Сериал")
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct MovieDetailsView: View {
    var movie: MovieItem
    var nextVideo: AnyVideo?

    var body: some View {
        FullItemView(
            item: movie.asItemInfo(),
            nextVideo: nextVideo
        )

        VStack {
            VideoList(videos: movie.videos.map { $0.asAnyVideo() })
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 50)
    }
}

struct SerialDetailsView: View {
    var serial: SerialItem
    var nextVideo: AnyVideo?
    var onToggleWatchlist: (() async -> Void)

    @State var selectedSeason: Season?

    var body: some View {
        FullItemView(
            item: serial.asItemInfo(),
            nextVideo: nextVideo,
            onToggleWatchlist: onToggleWatchlist
        )

        VStack {
            SeasonsSelector(
                selectedSeason: $selectedSeason,
                seasons: serial.seasons
            ).onAppear {
                // select first unwatched season
                selectedSeason = serial.seasons.first(where: { season in
                    let episodes = (season.episodes ?? [])
                    return episodes.contains(where: { episode in
                        return episode.watched == 0
                    })
                })

                // or first, if none unwatched found
                if selectedSeason == nil {
                    selectedSeason = serial.seasons.first
                }
            }

            if let selectedSeason = selectedSeason {
                VideoList(videos: (selectedSeason.episodes ?? []).map { $0.asAnyVideo() })
            }
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 50)
    }
}

// Preview

class PreviewItemDetailsViewModel: ItemDetailsViewModelable {
    @Published var movie: MovieItem? = nil;
    @Published var serial: SerialItem? = mockSerialItem;
    @Published var nextVideo: AnyVideo? = AnyVideo(
        id: 1,
        season: 1,
        episode: 2,
        timing: 1560
    );
    @Published var isError = false;
    @Published var isLoading = false;

    func fetchData(id: Int) {}
    func toggleWatchList() {}
}

struct ItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailsViewInternal(item: PreviewItemDetailsViewModel())
    }
}
