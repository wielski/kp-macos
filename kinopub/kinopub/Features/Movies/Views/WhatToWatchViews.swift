//
//  PopularMoviesView.swift
//  kinopub
//
//  Created by Andrzej Wielski on 02.01.2023.
//

import SwiftUI
import KinopubApi
import SwiftUIRouter

struct PopularMoviesView: View {
    @StateObject var popularMovies = PopularViewModel(
        type: "movie"
    )

    var body: some View {
        WhatToWatchViewInternal(
            movies: popularMovies
        )
    }
}

struct PopularSeriesView: View {
    @StateObject var popularSeries = PopularViewModel(
        type: "serial"
    )

    var body: some View {
        WhatToWatchViewInternal(
            movies: popularSeries
        )
    }
}

struct FreshMoviesView: View {
    @StateObject var freshMovies = FreshViewModel(
        type: "movie"
    )

    var body: some View {
        WhatToWatchViewInternal(
            movies: freshMovies
        )
    }
}

struct FreshSeriesView: View {
    @StateObject var freshSeries = FreshViewModel(
        type: "serial"
    )

    var body: some View {
        WhatToWatchViewInternal(
            movies: freshSeries
        )
    }
}

struct HotMoviesView: View {
    @StateObject var hotMovies = HotViewModel(
        type: "movie"
    )

    var body: some View {
        WhatToWatchViewInternal(
            movies: hotMovies
        )
    }
}

struct HotSeriesView: View {
    @StateObject var hotSeries = HotViewModel(
        type: "serial"
    )

    var body: some View {
        WhatToWatchViewInternal(
            movies: hotSeries
        )
    }
}

// Renderer

struct WhatToWatchViewInternal<ViewModel: WhatToWatchViewModelable>: View {
    @ObservedObject var movies: ViewModel

    var body: some View {
        ZStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(movies.items, id: \.self) { movie in
                        WideItemView(
                            item: movie
                        )
                    }
                }.padding(.horizontal, 30)
            }

            if (movies.isLoading) {
                Spinner(lineWidth: 10.0)
                    .frame(width: 60.0, height: 60.0)
            }

            if (movies.isError) {
                ErrorRetry() {
                    Task.init {
                        await movies.fetchData()
                    }
                }
            }
        }.frame(height: 220)
    }
}

// Preview

class PreviewPopularMoviesViewModel: WhatToWatchViewModelable {
    @Published var items: [ItemInfo] = [mockItem, mockItem, mockItem, mockItem, mockItem, mockItem, mockItem, mockItem, mockItem, mockItem];
    @Published var isError = true;
    @Published var isLoading = false;

    func fetchData() {} // do nothing while in a Preview
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        WhatToWatchViewInternal(
            movies: PreviewPopularMoviesViewModel()
        )
    }
}
