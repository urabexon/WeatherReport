//
//  DailyWeatherView.swift
//  WeatherAndMap
//
//  Created by Hiroki Urabe on 2025/02/16.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject var weatherVM: WeatherViewModel
    var body: some View {
        ScrollView(.horizontal) {
            if let forecastDay = weatherVM.forecast?.forecastsDay {
                HStack {
                    ForEach(forecastDay, id: \.self) { forecastDay in
                        // MARK: - 1日分の天気予報のUI
                        VStack(spacing: 5) { // 各部品の間隔を5に指定
                            // 日付(年月日)
                            Text(forecastDay.toDisplayDate(forecastDay.date))
                                .font(.callout)
                            
                            // 天気アイコン画像
                            AsyncImageView(urlStr: "https:\(forecastDay.day.condition.icon)")
                                .padding()
                                .scaledToFit()
                                
                            
                            // 天気の説明(晴れ、曇り 等)
                            Text(forecastDay.day.condition.text)
                            
                            // 最高気温 ℃ / 最低気温 ℃
                            HStack {
                                Text(forecastDay.day.maxTemp, format: .number)
                                    .foregroundStyle(.red)
                                Text("℃")
                                    .foregroundStyle(.red)
                                Text("/")
                                
                                Text(forecastDay.day.minTemp, format: .number)
                                    .foregroundStyle(.blue)
                                Text("℃")
                                    .foregroundStyle(.blue)
                            }
                            
                            // 降水確率: 〇〇 %
                            HStack {
                                Text("降水確率: ")
                                Text(forecastDay.day.dailyChanceOfRain, format: .number)
                                Text("%")
                            }
                            .font(.subheadline)
                        }
                        .padding()
                        .frame(width: ScreenInfo.width / 2, height: ScreenInfo.height / 3)
                        .background(.yellow.opacity(0.3))   // 背景色
                        .clipShape(.rect(cornerRadius: 10)) // 角丸に切り取る
                    }
                }
            } else {
                // コピペした部分。データが無いとき(または起動直後)に表示。
                HStack {
                    ForEach(0...2, id: \.self) { _ in // 3回繰り返して表示
                        // MARK: - 1日分の天気予報のUI
                        VStack(spacing: 5) { // 各部品の間隔を5に指定
                            // 日付(年月日)
                            Text("____年__月__日")
                            
                            // 天気アイコン画像
                            Image(systemName: "cloud.sun") // 今はサンプル画像
                                .resizable()
                                .scaledToFit()
                                .frame(width: 64, height: 64)
                            
                            // 天気の説明(晴れ、曇り 等)
                            Text("晴れのち曇り")
                            
                            // 最高気温 ℃ / 最低気温 ℃
                            HStack {
                                Text("最高") // 数字が入る
                                Text("℃ /")
                                Text("最低") // 数字が入る
                                Text("℃")
                            }
                            
                            // 降水確率: 〇〇 %
                            HStack {
                                Text("降水確率:")
                                Text("〇〇") // 数字が入る
                                Text("%")
                            }
                        }
                        .padding()
                        .frame(width: ScreenInfo.width / 2, height: ScreenInfo.height / 3)
                        .background(.yellow.opacity(0.3))   // 背景色
                        .clipShape(.rect(cornerRadius: 10)) // 角丸に切り取る
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var weatherVM = WeatherViewModel()
    // 八幡平市大更の緯度・経度
    let lat: Double = 39.91167
    let lon: Double = 141.093459
    
    DailyWeatherView(weatherVM: weatherVM)
        .onAppear {
            weatherVM.request3DaysForecast(lat: lat, lon: lon)
        }
}
