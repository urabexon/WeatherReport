//
//  HourlyWeatherView.swift
//  WeatherAndMap
//
//  Created by 卜部大輝 on 2025/02/16.
//

import SwiftUI

struct HourlyWeatherView: View {
    let defaultDateStr = "----年--月--日" // 日付が取得できていないときに表示する用
    @ObservedObject var weatherVM: WeatherViewModel // APIレスポンスの値を保持する用
    
    var body: some View {
        
        ForEach(0...2, id: \.self) { _ in
            VStack {
                // 区切り線
                Divider()
                // 日付
                Text("----年--月--日")
                    .padding(.vertical, 5) // 垂直方向に余白を5とる
                
                // 時間毎の天気予報
                HStack(spacing: 5) {
                    HourlyWeatherHeader()
                    
                    // 0~23時までの時間毎の予報
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ForEach(0...23, id: \.self) { _ in
                                // MARK: 1時間分の表示
                                VStack(spacing: 10) {
                                    // 時刻
                                    Text("0")
                                        .font(.subheadline)
                                    
                                    // 天気アイコン
                                    Image(systemName: "cloud.sun")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 64, height: 64)
                                    
                                    // 気温
                                    Text(20, format: .number)
                                        .font(.subheadline)
                                    
                                    // 降水確率
                                    Text(50, format: .number)
                                        .font(.subheadline)
                                }
                                .frame(width: ScreenInfo.width / 9)
                            }
                        }
                        .padding()
                        .frame(height: 180)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(.rect(cornerRadius: 10))
                    }
                }
            }
        }
    }
}

// MARK: - 時間毎の予報のヘッダー
struct HourlyWeatherHeader: View {
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Text("時刻(時)")
                .font(.caption)
            Text("天気")
                .font(.caption)
                .frame(maxHeight: 40)
            Text("気温(℃)")
                .font(.caption)
            Text("降水確率(%)")
                .font(.caption2)
        }
        .frame(width: 65, height: 180)
        .background(Color.blue.opacity(0.1))
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    @Previewable @StateObject var weatherVM = WeatherViewModel()
    // 緯度・経度
    let lat: Double = 39.91167
    let lon: Double = 141.093459
    
    HourlyWeatherView(weatherVM: weatherVM)
        .onAppear {
            weatherVM.request3DaysForecast(lat: lat, lon: lon)
        }
}
