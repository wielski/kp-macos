//
//  AVVideoPlayer.swift
//  kinopub
//
//  Created by Andrzej Wielski on 06.01.2023.
//

import SwiftUI
import AVKit

struct AVVideoPlayer: NSViewRepresentable {
    @ObservedObject var viewModel: AVPlayerViewModel

    func makeNSView(context: Context) -> AVPlayerView {
        let vc = AVPlayerView()
        vc.player = viewModel.player
        vc.delegate = context.coordinator
        vc.allowsPictureInPicturePlayback = true
        vc.showsFullScreenToggleButton = true
        vc.showsFrameSteppingButtons = true
        vc.showsTimecodes = true
        // vc.controlsStyle = .floating
        return vc
    }

    func updateNSView(_ nsViewController: AVPlayerView, context: Context) { }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, AVPlayerViewDelegate {
        let parent: AVVideoPlayer

        init(_ parent: AVVideoPlayer) {
            self.parent = parent
        }

        func playerViewWillStartPictureInPicture(_ playerView: AVPlayerView) {
            parent.viewModel.pipStatus = .willStart
        }

        func playerViewControllerDidStartPictureInPicture(_ playerView: AVPlayerView) {
            parent.viewModel.pipStatus = .didStart
        }

        func playerViewControllerWillStopPictureInPicture(_ playerView: AVPlayerView) {
            parent.viewModel.pipStatus = .willStop
        }

        func playerViewControllerDidStopPictureInPicture(_ playerView: AVPlayerView) {
            parent.viewModel.pipStatus = .didStop
        }

        func playerViewWillEnterFullScreen(_ playerView: AVPlayerView) {
//            NSApp?.mainWindow?.toolbar?.isVisible = false
        }
 
        func playerViewWillExitFullScreen(_ playerView: AVPlayerView) {
//            NSApp?.mainWindow?.toolbar?.isVisible = true
        }
    }
}
