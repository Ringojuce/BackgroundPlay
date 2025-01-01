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
                
                NavigationLink(destination: ContentListView(items: ["犬", "猫", "ゴリラ"])) {
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
            .navigationTitle("初期画面")
        }
    }
    
    
}

///プレビュー
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
