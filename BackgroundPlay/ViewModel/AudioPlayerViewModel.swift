//
//  Untitled.swift
//  BackgroundPlay
//
//  Created by miya on 2024/12/28.
//

import SwiftUI
import AVFoundation
import MediaPlayer

class AudioPlayerViewModel: ObservableObject {
    var player: AVPlayer?

    init() {
        configureAudioSession()
    }

    func configureAudioSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.playback, mode: .default)
            try audioSession.setActive(true)
        } catch {
            print("Audio session setup failed: \(error)")
        }
    }

    func playMedia(from url: URL) {
        player = AVPlayer(url: url)
        player?.play()
        setupNowPlayingInfo()
    }

    func setupNowPlayingInfo() {
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle: "Media File",
            MPNowPlayingInfoPropertyPlaybackRate: 1.0
        ]
    }
}
