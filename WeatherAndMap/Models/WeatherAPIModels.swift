import Foundation

// レスポンス全体の大枠
struct WeatherInfo: Codable {
    let location: UserLocation
    let forecast: Forecast
}

// MARK: - ユーザーの位置とそれに関連した情報
struct UserLocation: Codable {
    let name: String
    let region: String
    let country: String
    let timezoneID: String
    let localTime: String
    
    // キャメルケースとスネークケースの相互変換するための記述
    enum CodingKeys: String, CodingKey {
        case name
        case region
        case country
        case timezoneID = "tz_id"
        case localTime = "localtime"
    }
}

// MARK: - 天気予報の情報全体
struct Forecast: Codable {
    // 取得した日数分の予報
    let forecastsDay: [ForecastDay]
        
    // Swift: forecastsDay ⇔ API: "forecastday"変換の記述
    enum CodingKeys: String, CodingKey {
        case forecastsDay = "forecastday"
    }
}
    
// 1日分の予報(1日と時間毎)
struct ForecastDay: Codable, Hashable {
    let date: String
    let day: DailyForecast
    let hour: [HourlyForecast]
    
    func toDisplayDate(_ date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: date) else { return "" }  // String型を一度Date型に変換
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter.string(from: date) // Date型から指定した形式にしてString型に変換して返す
    }
}
    
// 日毎の予報
struct DailyForecast: Codable, Hashable {
    let maxTemp: Double
    let minTemp: Double
    let dailyChanceOfRain: Double
    let condition: Condition
    
    enum CodingKeys: String, CodingKey {
        case maxTemp = "maxtemp_c"
        case minTemp = "mintemp_c"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case condition
    }
}
    
// 時間毎の予報
struct HourlyForecast: Codable, Hashable {
    let time: String
    let temperature: Double
    let condition: Condition
    let chanceOfRain: Double
        
    enum CodingKeys: String, CodingKey {
        case time
        case temperature = "temp_c"
        case condition
        case chanceOfRain = "chance_of_rain"
    }
}
    
// 天気の説明とアイコン画像URL
struct Condition: Codable, Hashable {
    let text: String
    let icon: String
}

// 毎時予報表示用の構造体
struct HourlyDisplayForecast: Identifiable {
    var id = UUID()
    let date: String
    let time: String
    let weatherIcon: String
    let temperature: Double
    let chanceOfRain: Double
}
