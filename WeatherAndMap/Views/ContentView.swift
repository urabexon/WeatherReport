//
//  ContentView.swift
//  WeatherAndMap
//
//  Created by Hiroki Urabe on 2025/02/15.
//

import SwiftUI

struct ContentView: View {
    // APIへリクエスト、レスポンスの値を保持するオブジェクト
    @StateObject private var weatherVM = WeatherViewModel()
    
    // 緯度・経度
    var lat: Double = 39.91167
    var lon: Double = 141.093459
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            weatherVM.request3DaysForecast(lat: lat, lon: lon)
        }
    }
}

#Preview {
    ContentView()
}
