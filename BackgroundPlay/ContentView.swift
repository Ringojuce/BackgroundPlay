//
//  ContentView.swift
//  BackgroundPlay
//
//  Created by miya on 2024/07/29.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var showDocumentPicker = false
    @State private var selectedFile: URL?
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            Button("Select File") {
                showDocumentPicker = true
            }
            .sheet(isPresented: $showDocumentPicker) {
                DocumentPicker(selectedFile: $selectedFile)
            }

            if let fileURL = selectedFile {
                Text("Selected file: \(fileURL.lastPathComponent)")
                Button("Play Audio") {
                    playAudio(url: fileURL)
                }
            }
        }
        .padding()
    }

    func playAudio(url: URL) {
        do {
            let fileExists = FileManager.default.fileExists(atPath: url.path)
            print("File exists: \(fileExists)")
            
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            print("Playing audio from: \(url)") // 再生開始メッセージを出力
        } catch {
            print("Failed to initialize audio player: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

