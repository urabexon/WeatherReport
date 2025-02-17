# WeatherReport

Weather APIから取得した日毎・時間毎の天気情報に加え、各日の月の満ち欠け（ムーンフェーズ）情報を表示します。<br>
ユーザーの現在地や指定した地点（例：東京、サンフランシスコ）の天気と月相を確認することができます。

## 主な機能

- **日毎の天気予報表示**  
  日付、天気アイコン、天気の説明、最高・最低気温、降水確率を表示します。

- **時間毎の天気予報表示**  
  各時間の天気状況、温度、降水確率を表示します。

- **月の満ち欠けの画像表示**  
  Weather APIから取得した月相データに基づいて、8種類の月の画像（New Moon, Waxing Crescent, First Quarter, Waxing Gibbous, Full Moon, Waning Gibbous, Last Quarter, Waning Crescent）を表示します。  
  ※ APIのレスポンスとアセット名が一致するように、前処理を行っています。

- **位置情報の活用**  
  ユーザーの現在地や地図上のマーカー位置に基づいて、天気情報を自動で取得します。

## 技術スタック

- Swift / SwiftUI  
- URLSessionを利用した非同期通信  
- CodableによるJSONパース  
- LocationManagerによる位置情報取得