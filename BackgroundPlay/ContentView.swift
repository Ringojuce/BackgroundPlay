//
//  ContentView.swift
//  BackgroundPlay
//
//  Created by miya on 2024/07/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: ContentListView(items: ["りんご", "レモン", "アボガド"])) {
                    HStack {
                        Image(systemName: "icloud")
                            .font(.title)
                        Text("iCloud File")
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                }
                
                NavigationLink(destination: ContentListView(items: getFetchFileMetadata(for: .documentDirectory))) {
                    HStack {
                        Image(systemName: "externaldrive.fill")
                            .font(.title)
                        Text("Local File")
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                }
            }
            .padding()
            .navigationTitle("ファイルアクセス画面")
        }
    }
    
    // iCloud またはローカルからデータを取得
    private func getFetchFileMetadata(for directory: FileManager.SearchPathDirectory) -> [String]
    {
        let documentDirectory = FileManager.default.urls(for: directory, in: .userDomainMask).first!
        var fileNames: [String] = []
        
        do {
            let files = try FileManager.default.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
            fileNames = files.map { $0.lastPathComponent } // ファイル名のみ取得
        } catch {
            print("Error accessing files: \(error)")
        }
        
        return fileNames
    }
}

///プレビュー
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
