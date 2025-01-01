//
//  ContentListView.swift
//  BackgroundPlay
//
//  Created by miya on 2024/12/31.
//

import SwiftUI

//指定したフォルダ直下ファイル一覧を動的に表示
struct ContentListView: View {
    let items: [String]

        var body: some View {
            List(items, id: \ .self) { item in
                Text(item)
                    .font(.body)
            }
            .navigationTitle("再生ファイル一覧")
        }
}
