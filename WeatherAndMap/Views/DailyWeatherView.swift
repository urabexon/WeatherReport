//
//  DailyWeatherView.swift
//  WeatherAndMap
//
//  Created by Hiroki Urabe on 2025/02/16.
//

import SwiftUI

struct DailyWeatherView: View {
    var body: some View {
        ScrollView(.horizontal) { // 水平方向(.horizontal)にスクロールする
            HStack {
                ForEach(0...2, id: \.self) { _ in
                    // MARK: - 1日分の天気予報のUI
                    VStack(spacing: 5) {
                        // 日付(年月日)
                        Text("____年__月__日")
                        
                        // 天気アイコン
                        Image(systemName: "cloud.sun")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                        
                        // 天気の説明(晴れ、曇りなど)
                        Text("晴れのち曇り")
                        
                        // 最高気温 / 最低気温
                        HStack {
                            Text("最高") // 数字が入る
                            Text("℃ /")
                            Text("最低") // 数字が入る
                            Text("℃")
                        }
                        
                        // 洪水確率 〇〇 %
                        HStack {
                            Text("降水確率:")
                            Text("〇〇") // 数字が入る
                            Text("%")
                        }
                    }
                    .padding()
                    .frame(width: ScreenInfo.width / 2, height: ScreenInfo.height / 3)
                    .background(.yellow.opacity(0.3))
                    .clipShape(.rect(cornerRadius: 10))
                }
            }
        }
    }
}

#Preview {
    DailyWeatherView()
}
