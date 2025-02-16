//
//  AsyncImageView.swift
//  WeatherAndMap
//
//  Created by Hiroki Urabe on 2025/02/16.
//

import SwiftUI

struct AsyncImageView: View {
    // 画像URLの文字列
    let urlStr: String
    
    var body: some View {
        // URL型に変換できたらAsyncImageで画像を取得
        if let url = URL(string: urlStr) {
            AsyncImage(url: url) { image in
                image // この部分が取得した画像を表示するビュー
                    .resizable() // リサイズ可能にする
            } placeholder: {
                ProgressView() // 進捗のインジケータのビュー
                    .scaledToFit()
            }
        } else { // 🔹ここを修正
            Text("No Image")
        }
    }
}

#Preview {
    let urlStr = "https://www.city.hachimantai.lg.jp/img/common/top_logo.png"
    AsyncImageView(urlStr: urlStr)
}
