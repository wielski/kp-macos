//
//  WhatToWatchView.swift
//  kinopub
//
//  Created by Andrzej Wielski on 03.01.2023.
//

import SwiftUI

struct WhatToWatchScreen: View {
    var body: some View {
        ScrollView(.vertical) {
            Group {
                WhatToWatchPopular()
                WhatToWatchHot()
                WhatToWatchFresh()
            }
        }
        .navigationTitle("Что посмотреть")
    }
}

struct WhatToWatchPopular: View {
    var body: some View {
        Group {
            WhatToWatchTitle(text: "Популярные фильмы")
                .padding(.horizontal, 30)
                .padding(.top, 30)
            PopularMoviesView()
                .padding(.bottom, 30)
            
            WhatToWatchTitle(text: "Популярные сериалы")
                .padding(.horizontal, 30)
            PopularSeriesView()
                .padding(.bottom, 30)
        }
    }
}

struct WhatToWatchHot: View {
    var body: some View {
        Group {
            WhatToWatchTitle(text: "Горячие фильмы")
                .padding(.horizontal, 30)
            HotMoviesView()
                .padding(.bottom, 30)
            
            WhatToWatchTitle(text: "Горячие сериалы")
                .padding(.horizontal, 30)
            HotSeriesView()
                .padding(.bottom, 30)
        }
    }
}

struct WhatToWatchFresh: View {
    var body: some View {
        Group {
            WhatToWatchTitle(text: "Новые фильмы")
                .padding(.horizontal, 30)
            FreshMoviesView()
                .padding(.bottom, 30)
            
            WhatToWatchTitle(text: "Новые сериалы")
                .padding(.horizontal, 30)
            FreshSeriesView()
                .padding(.bottom, 30)
        }
    }
}

struct WhatToWatchTitle: View {
    var text: String

    var body: some View {
        HStack {
            Text(text)
                .font(.title)

            Spacer()

            Button(action: { }) {
                Text("Еще")
                Image(systemName: "chevron.right")
            }
            .withStyle(.more)
        }
    }
}

struct WhatToWatchView_Previews: PreviewProvider {
    static var previews: some View {
        WhatToWatchScreen()
    }
}
