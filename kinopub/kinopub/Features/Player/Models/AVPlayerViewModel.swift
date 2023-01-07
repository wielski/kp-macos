//
//  AVPlayerViewModel.swift
//  kinopub
//
//  Created by Andrzej Wielski on 06.01.2023.
//

import Combine
import AVKit

enum PipStatus {
    case willStart
    case didStart
    case willStop
    case didStop
    case undefined
}

struct Media {
    let title: String
    let url: String
}

final class AVPlayerViewModel: ObservableObject {
    @Published var pipStatus: PipStatus = .undefined
    @Published var media: Media?

    let player = AVPlayer()
    private var cancellable: AnyCancellable?

    init() {
        cancellable = $media
            .compactMap({ $0 })
            .compactMap({ URL(string: $0.url) })
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                self.player.replaceCurrentItem(with: AVPlayerItem(url: $0))
            })
    }

    func play() {
        player.play()
    }

    func pause() {
        player.pause()
    }

    func seek(to: CMTime) {
        player.seek(to: to)
    }
}
