//
//  PlayerScreen.swift
//  kinopub
//
//  Created by Andrzej Wielski on 06.01.2023.
//

import SwiftUI
import AVKit
import KinopubApi

struct PlayerScreen: View {
    var mediaId: Int
    var startFrom: Int?

    @StateObject var playerModel = PlayerViewModel()
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
                   // disable sidebar opening
                   sidebarSettings.disableSidebar()

                   Task.init {
                       await playerModel.fetchData(id: mediaId)
                   }
               }
               .onDisappear {
                   if (sidebarWasCollapsed && sidebarSettings.collapsed) {
                       // Show sidebar if it was collapsed
                       SidebarAccessor.toggleSidebar()
                   }
                   // allow sidebar opening
                   sidebarSettings.enableSidebar()
               }

            if playerModel.urls != nil {
                PlayerScreenViewInternal(
                    playerModel: playerModel,
                    startFrom: startFrom
                )
            }

            if (playerModel.isLoading) {
                Spinner(lineWidth: 10.0)
                    .frame(width: 60.0, height: 60.0)
            }

            if playerModel.isError {
                ErrorRetry() {
                    Task.init {
                        await playerModel.fetchData(id: mediaId)
                    }
                }
            }
        }
    }
}

struct PlayerScreenViewInternal<ViewModel: PlayerViewModelable>: View {
    @StateObject var avPlayerModel = AVPlayerViewModel()

    @ObservedObject var playerModel: ViewModel
    var startFrom: Int?

    init(playerModel: ViewModel, startFrom: Int?) {
        self.playerModel = playerModel
        self.startFrom = startFrom
    }

    var body: some View {
        AVVideoPlayer(viewModel: avPlayerModel)
            .onAppear {
                avPlayerModel.media = Media(
                    title: "My video",
                    url: playerModel.urls!.hls4!
                )

                avPlayerModel.play()
                if let startFrom = startFrom {
                    let videoStartTime: CMTime = CMTimeMake(value: Int64(startFrom), timescale: 1)

                    avPlayerModel.seek(to: videoStartTime)
                }
            }
            .onDisappear {
                avPlayerModel.pause()
            }
    }
}

// Preview

class PreviewPlayerViewModel: PlayerViewModelable {
    @Published var urls: PlayerUrls? = PlayerUrls(
        hls4: "http://amssamples.streaming.mediaservices.windows.net/634cd01c-6822-4630-8444-8dd6279f94c6/CaminandesLlamaDrama4K.ism/manifest(format=m3u8-aapl)",
        hls2: [
            "1080p": "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8"
        ],
        hls: [
            "1080p": "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8"
        ],
        http: [
            "1080p": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        ]
    );
    @Published var isError = false;
    @Published var isLoading = false;

    func fetchData(id: Int) {}
}

struct PlayerScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayerScreenViewInternal(
            playerModel: PreviewPlayerViewModel(),
            startFrom: 10
        )
    }
}
