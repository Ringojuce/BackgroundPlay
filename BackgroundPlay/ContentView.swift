//
//  ContentView.swift
//  BackgroundPlay
//
//  Created by miya on 2024/07/29.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var files: [URL] = []
    @State private var selectedURL: URL?
    private let viewModel = AudioPlayerViewModel()

    var body: some View {
        VStack {
            if let selectedURL {
                Text("Selected: \(selectedURL.lastPathComponent)")
                Button("Play") {
                    viewModel.playMedia(from: selectedURL)
                }
            } else {
                Text("No file selected")
            }

            List(files, id: \.self) { file in
                Button(action: {
                    selectedURL = file
                }) {
                    Text(file.lastPathComponent)
                }
            }
            .onAppear(perform: loadFiles)

            Button("Refresh") {
                loadFiles()
            }
        }
        .padding()
    }

    func loadFiles() {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        if let documentsURL {
            do {
                files = try FileManager.default.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            } catch {
                print("Error loading files: \(error.localizedDescription)")
            }
        }
    }
    
    func createCustomDirectory() {
        let customDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("CustomFolder")
        if let customDirectoryURL, !FileManager.default.fileExists(atPath: customDirectoryURL.path) {
            do {
                try FileManager.default.createDirectory(at: customDirectoryURL, withIntermediateDirectories: true, attributes: nil)
                print("Custom directory created at \(customDirectoryURL)")
            } catch {
                print("Error creating custom directory: \(error.localizedDescription)")
            }
        }
    }
}

class AudioPlayerViewModel {
    var player: AVPlayer?

    func playMedia(from url: URL) {
        player = AVPlayer(url: url)
        player?.play()
    }
}

///プレビュー
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
