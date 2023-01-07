//
//  FullItemView.swift
//  kinopub
//
//  Created by Andrzej Wielski on 04.01.2023.
//

import SwiftUI
import SwiftUIRouter
import NukeUI
import KinopubApi

struct FullItemView: View {
    var item: ItemInfo
    var nextVideo: AnyVideo?
    var onToggleWatchlist: (() async -> Void)?

    @StateObject var voteModel = VoteViewModel()
    
    var body: some View {
        FullItemViewInternal(
            vote: voteModel,
            item: item,
            nextVideo: nextVideo,
            onToggleWatchlist: onToggleWatchlist
        )
    }
}

struct FullItemViewInternal<ViewModel: VoteViewModelable>: View {
    @ObservedObject var vote: ViewModel
    var item: ItemInfo
    var nextVideo: AnyVideo?
    var onToggleWatchlist: (() async -> Void)?

    var body: some View {
        ZStack(alignment: .topLeading) {
            FullItemCover(imageUrl: item.posters?.wide ?? "").zIndex(0)

            VStack(alignment: .leading) {
                FullItemHeader(
                    vote: vote,
                    item: item,
                    onToggleWatchlist: onToggleWatchlist
                    )
                    .padding(.top, 50.0)
                    .padding(.horizontal, 50.0)
                    .padding(.bottom, 20.0)

                FullItemAbout(item: item, nextVideo: nextVideo)
                    .padding(.horizontal, 50.0)
                    .padding(.bottom, 60.0)
            }
            .zIndex(1)
        }
        .frame(minWidth: 900)
        .fixedSize(horizontal: false, vertical: true)
        .clipShape(Rectangle())
    }
}

// Components

struct FullItemHeader<ViewModel: VoteViewModelable>: View {
    @ObservedObject var vote: ViewModel
    var item: ItemInfo
    var onToggleWatchlist: (() async -> Void)?

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(item.title ?? "")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .shadow(
                        color: Color.black.opacity(0.2),
                        radius: 20,
                        x: 0,
                        y: 0
                    )
                
                Spacer()

                HStack {
                    Label() {
                        Text(vote.positive ?? "")
                    } icon: {
                        Image(systemName: vote.liked != nil && vote.liked! ? "heart.fill" : "heart")
                    }.onTapGesture {
                        Task.init {
                            await vote.voteFor(id: Int(item.id!), like: true)
                        }
                    }
                    
                    Label() {
                        Text(vote.negative ?? "")
                    } icon: {
                        Image(systemName: vote.liked != nil && !vote.liked! ? "heart.slash.fill" : "heart.slash")
                    }.onTapGesture {
                        Task.init {
                            await vote.voteFor(id: Int(item.id!), like: true)
                        }
                    }

                    if let onToggleWatchlist = onToggleWatchlist {
                        Label() {
                            Text(item.inWatchlist ?? false ? "Я смотрю" : "Буду смотреть")
                        } icon: {
                            Image(systemName: "eye")
                        }
                        .foregroundColor(
                            item.inWatchlist ?? false ? .black : .primary
                        )
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .frame(height: 25)
                                .foregroundColor(item.inWatchlist ?? false ? .white : .clear)
                            )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            Task.init {
                                await onToggleWatchlist()
                            }
                        }
                    }
                }
            }

            Divider()

            HStack {
                HStack {
                    if let countries = item.countries {
                        HStack(spacing: 2) {
                            Text("Страна:")
                            Text(countries.map {
                                return $0.title ?? ""
                            }.joined(separator: ", "))
                        }
                    }
                }
                .shadow(
                    color: Color.black.opacity(0.2),
                    radius: 20,
                    x: 0,
                    y: 0
                )

                Spacer()

                HStack {
                    Label() {
                        Text(String(format: "%.1f", (item.ratingPercentage ?? 0) / 10))
                    } icon: {
                        Image("kinopub")
                    }
                    .opacity(0.8)

                    Label() {
                        Text(String(format: "%.1f", item.imdbRating ?? 0.0))
                    } icon: {
                        Image("imdb")
                    }
                    .opacity(0.8)

                    Label() {
                        Text(String(format: "%.1f", item.kinopoiskRating ?? 0.0))
                    } icon: {
                        Image("kinopoisk")
                    }
                    .opacity(0.8)
                }
            }
        }
    }
}

struct FullItemAbout: View {
    var item: ItemInfo
    var nextVideo: AnyVideo?

    var body: some View {
        HStack(alignment: .top) {
            VStack {
                ItemImageView(
                    imageUrl: (item.posters?.medium ?? ""))
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
                    .shadow(
                        color: Color.black.opacity(0.1),
                        radius: 20,
                        x: 20,
                        y: 20
                    )
                    .padding(.bottom, 20)

                PlayVideo(nextVideo: nextVideo)
                PlayTrailer(trailer: item.trailer)
            }

            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Описание")
                        .font(.caption2)
                        .fontWeight(.bold)
                    
                    LongText(
                        item.plot ?? "",
                        inSheet: true,
                        sheetTitle: item.title ?? ""
                    )
                }
                .padding()
                .background(.regularMaterial)
                .cornerRadius(8)

                HStack {
                    FullItemCard(
                        title: "Качество",
                        content: getQualityString()
                    )

                    if item.isSerial() {
                        FullItemCard(
                            title: "Длительность серии",
                            content: getAverageDurationString()
                        )
                    }
                    
                    FullItemCard(
                        title: "Продолжительность",
                        content: getTotalDurationString()
                    )
                }
            }

            VStack(alignment: .leading) {
                Text("В ролях")
                    .font(.caption2)
                    .fontWeight(.bold)

                FlexibleView(
                    data: getCast(),
                    spacing: 2,
                    alignment: .leading
                ) { item in
                    Text(item.name)
                        .padding(.all, 10)
                        .background(.regularMaterial)
                        .cornerRadius(8)
                }

                Text("Режиссёр")
                    .font(.caption2)
                    .fontWeight(.bold)

                FlexibleView(
                    data: getDirectors(),
                    spacing: 2,
                    alignment: .leading
                ) { item in
                    Text(item.name)
                        .padding(.all, 10)
                        .background(.regularMaterial)
                        .cornerRadius(8)
                }

            }
        }
    }

    func getQualityString() -> String {
        if item.quality == nil {
            return "Неизвестно"
        }

        if item.quality! <= 480 {
            return "480p"
        }

        if item.quality! <= 720 {
            return "720p"
        }

        if item.quality! <= 1080 {
            return "1080p"
        }

        return "4K"
    }

    func getAverageDurationString() -> String {
        if let averageDuration = item.duration?.average {
            return self.formatSeconds(Int(averageDuration))
        }
        return "Неизвестно"
    }

    func getTotalDurationString() -> String {
        if let totalDuration = item.duration?.total {
            return self.formatSeconds(Int(totalDuration))
        }
        return "Неизвестно"
    }

    func getCast() -> [CastItem] {
        return (item.cast ?? "").components(separatedBy: ", ").map { CastItem(name: $0) }
    }

    func getDirectors() -> [CastItem] {
        return (item.director ?? "").components(separatedBy: ", ").map { CastItem(name: $0) }
    }

    private func formatSeconds(_ interval: Int) -> String {
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "ru")
        let formatter = DateComponentsFormatter()
        formatter.calendar = calendar
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .short

        return formatter.string(from: TimeInterval(interval))!
    }
}

struct FullItemCard: View {
    var title: String
    var content: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.caption2)
                .fontWeight(.bold)
                .opacity(0.8)

            Text(content)
                .font(.title2)
        }
        .padding()
        .background(.regularMaterial)
        .cornerRadius(8)
        .shadow(
            color: Color.black.opacity(0.1),
            radius: 20,
            x: 20,
            y: 20
        )
    }
}

// Play video button

struct PlayVideo: View {
    @EnvironmentObject var navigator: Navigator
    @Environment(\.colorScheme) var colorScheme
    var nextVideo: AnyVideo?

    var body: some View {
        VStack {
            if let subText = getPlaySubText(),
               let text = getPlayText() {
                Text(text)
                    .font(.title3)
                    .fontWeight(.bold)
                    .shiny(.rainbow)
                Text(subText)
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
            } else if let text = getPlayText() {
                Text(text)
                    .font(.title2)
                    .fontWeight(.bold)
                    .shiny(.rainbow)
            }
        }
        .frame(width: 192, height: 55)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 192, height: 55)
                .foregroundColor(.white)
            )
        .contentShape(Rectangle())
        .onTapGesture {
            if let id = nextVideo?.id,
               let timing = nextVideo?.timing {
                navigator.navigate("/Player/\(id)/\(timing)")
            }
        }
    }

    func getPlayText() -> String {
        if nextVideo?.timing != nil && nextVideo?.timing != 0 {
            return "Продолжить"
        }
        return "Смотреть"
    }

    func getPlaySubText() -> String? {
        let timeString = getNextVideoTimeString()

        if let season = nextVideo?.season,
           let episode = nextVideo?.episode {
            if let timeString = timeString {
                return "s\(season)e\(episode) с \(timeString)"
            } else {
                return "s\(season)e\(episode)"
            }
        }

        if let timeString = timeString {
            return "с \(timeString)"
        }

        return nil
    }

    func getNextVideoTimeString() -> String? {
        if let interval = nextVideo?.timing {
            if interval == 0 {
                return nil
            }
            var calendar = Calendar.current
            calendar.locale = Locale(identifier: "ru")
            let formatter = DateComponentsFormatter()
            formatter.calendar = calendar
            formatter.allowedUnits = [.hour, .minute, .second]
            formatter.unitsStyle = .short
            
            return formatter.string(from: TimeInterval(interval))!
        }

        return nil
    }
}

// Background cover

struct FullItemCover: View {
    var imageUrl: String
    @StateObject private var image = FetchImage()

    var body: some View {
        ZStack {
            GeometryReader { proxy in
                image.view?
                    .resizable()
                    .scaledToFill()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .clipped()
            }.ignoresSafeArea()

            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.thickMaterial)

            GeometryReader { proxy in
                image.view?
                    .resizable()
                    .scaledToFill()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .clipped()
                    .mask(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                .black.opacity(0.5),
                                .black.opacity(0.2),
                                .black.opacity(0),
                                .black.opacity(0)
                            ]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
            }.ignoresSafeArea()
        }
        .onAppear { image.load(URL(string: imageUrl.replacingOccurrences(of: "http://", with: "https://"))) }
        .onChange(of: imageUrl) { image.load(URL(string: $0.replacingOccurrences(of: "http://", with: "https://"))) }
        .onDisappear { image.reset() }
    }
}

// Trailer player

struct PlayTrailer: View {
    @State var shouldPresentSheet = false

    var trailer: ItemInfoTrailer?

    var body: some View {
        if let trailer = trailer {
            HStack {
                Image(systemName: "play")
                    .foregroundColor(.black.opacity(0.8))
                Text("Трейлер")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.8))
            }
            .frame(width: 192, height: 55)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 192, height: 55)
                    .foregroundColor(.white)
            )
            .contentShape(Rectangle())
            .onTapGesture {
                shouldPresentSheet = true
            }
            .sheet(isPresented: $shouldPresentSheet) {
                shouldPresentSheet = false
            } content: {
                FullItemTrailer(trailer: trailer)
                    .frame(minWidth: 800, minHeight: 600)
            }
        }
    }
}

struct FullItemTrailer: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var avPlayerModel = AVPlayerViewModel()

    var trailer: ItemInfoTrailer

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Text("Трейлер")
                Spacer()
                Button("Закрыть") {
                    dismiss()
                }
                .buttonStyle(.link)
                .font(.body)
                .foregroundColor(.primary)
            }
            .padding(.all, 10)
            .background(.black.opacity(0.1))

            Divider()

            AVVideoPlayer(viewModel: avPlayerModel)
                .onAppear {
                    if let url = trailer.url {
                        avPlayerModel.media = Media(
                            title: "Трейлер",
                            url: url
                        )
                        
                        avPlayerModel.play()
                    }
                }
                .onDisappear {
                    avPlayerModel.pause()
                }
        }
    }
}

// Utils

struct CastItem: Identifiable, Hashable {
    var id: String { name }
    var name: String
}

// Preview

class PreviewVoteViewModel: VoteViewModelable {
    @Published var liked: Bool? = true;
    @Published var voted: Bool? = true;
    @Published var total: String? = "1939";
    @Published var positive: String? = "1299";
    @Published var negative: String? = "340";
    @Published var isError = true;
    @Published var isLoading = false;

    func voteFor(id: Int, like: Bool) {} // do nothing while in a Preview
}

struct FullItemView_Previews: PreviewProvider {
    static var previews: some View {
        FullItemViewInternal(
            vote: PreviewVoteViewModel(),
            item: mockSerialItem.asItemInfo(),
            nextVideo: AnyVideo(
                id: 1,
                season: 1,
                episode: 2,
                timing: 1024
            ),
            onToggleWatchlist: {}
        )
    }
}
