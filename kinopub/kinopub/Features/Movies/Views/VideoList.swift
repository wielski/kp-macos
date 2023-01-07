//
//  VideoList.swift
//  kinopub
//
//  Created by Andrzej Wielski on 07.01.2023.
//

import SwiftUI
import SwiftUIRouter
import KinopubApi
import NukeUI

struct VideoList: View {
    var videos: [AnyVideo]

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(videos, id: \.id) { video in
                    VideoItem(video: video)
                }
            }
        }
    }
}

struct VideoItem: View {
    @EnvironmentObject var navigator: Navigator
    var video: AnyVideo

    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                VideoItemImage(imageUrl: video.thumbnail ?? "")
                
                VStack(alignment: .leading) {
                    Text(video.title ?? "")
                        .font(.title3)
                    
                    if let season = video.season,
                       let episode = video.episode {
                        Text("\(season) сезон, \(episode) серия")
                            .font(.caption)
                            .opacity(0.8)
                    }
                }
                .padding(.leading, 20)
                .padding(.bottom, 20)
                
                if video.isStarted ?? false {
                    if let duration = video.duration,
                       let timing = video.timing {
                        Group {
                            VideoItemProgress(
                                duration: duration, timing: timing
                            )
                            .frame(height:6)
                        }.padding(.all, 5)
                    }
                }
            }

            if video.isWatched ?? false {
                Rectangle().foregroundColor(.black.opacity(0.5))
                Text("Просмотрено")
            }
        }
        .frame(width: 300, height: 160)
        .background(Color.black.opacity(0.1))
        .cornerRadius(8)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 8,
                style: .continuous
            )
        )
        .onTapGesture {
            if let id = video.id {
                let timing = video.timing ?? 0
                navigator.navigate("/Player/\(id)/\(timing)")
            }
        }
    }
}

struct VideoItemImage: View {
    var imageUrl: String
    @StateObject private var image = FetchImage()

    var body: some View {
        ZStack {
            image.view?
                .frame(width: 300, height: 160)

            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.regularMaterial)

            image.view?
            .frame(width: 300, height: 160)
                .mask(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .black.opacity(0), location: 0.35),
                            .init(color: .black, location: 1),
                        ]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
        }
        .onAppear { image.load(URL(string: imageUrl.replacingOccurrences(of: "http://", with: "https://"))) }
        .onChange(of: imageUrl) { image.load(URL(string: $0.replacingOccurrences(of: "http://", with: "https://"))) }
        .onDisappear { image.reset() }
    }
}

struct VideoItemProgress: View {
    var duration: Int64
    var timing: Int64

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.4)
                    .cornerRadius(8)
                    .foregroundColor(.black.opacity(0.2))

                Rectangle().frame(
                    width: min(CGFloat(
                        CGFloat(timing) / CGFloat(duration)
                    ) * geometry.size.width, geometry.size.width),
                    height: geometry.size.height
                )
                .cornerRadius(8)
                .foregroundColor(.primary.opacity(0.9))
            }
        }
    }
}

struct SeasonsSelector: View {
    @Binding var selectedSeason: Season?
    var seasons: [Season]

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(seasons, id: \.id) { season in
                    Button(action: {
                        selectedSeason = season
                    }) {
                        Text("\(season.number!)")
                            .padding(10.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(
                                        lineWidth: selectedSeason?.number ?? 0 == season.number ? 2.0 : 0
                                    )
                                    .frame(minWidth: 35, minHeight: 35)
                            )
                            .frame(minWidth: 38, minHeight: 38)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

struct SeasonsSelector_Previews: PreviewProvider {
    static var previews: some View {
        SeasonsSelector(
            selectedSeason: .constant(Season(id: 1, number: 1)),
            seasons: [
                Season(id: 1, number: 1),
                Season(id: 2, number: 2),
            ]
        )
    }
}

struct VideoList_Previews: PreviewProvider {
    static var previews: some View {
        VideoList(videos: [
            AnyVideo(
                id: 1,
                title: "Дочь среды - сестра беды",
                thumbnail: "https://cdn.service-kp.com/thumb/4/2b/0YydjXRSChC3Xb7N9/1785000/480x270.jpg",
                season: 1,
                episode: 1,
                isWatched: true,
                isStarted: false,
                duration: 3000,
                timing: 2900
            ),
            AnyVideo(
                id: 2,
                title: "Беда приходит одна",
                thumbnail: "https://cdn.service-kp.com/thumb/d/4f/5gYHvNzK6WHisEmuW/1464000/480x270.jpg",
                season: 1,
                episode: 2,
                isWatched: false,
                isStarted: true,
                duration: 3000,
                timing: 450
            )
        ])
    }
}
