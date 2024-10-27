# ハッカソン本番用のフォルダ

## 作るアプリ
tbd

## ルール
* flutterバージョン
  * 3.24.0
  * （fvmを使う）
* アーキテクチャ
  * MVVM
* 状態管理
  * Riverpodなど
* モデル定義
  * freezed

## 使い方
ターミナルでコマンドを打つ時は、「/flutter_hackathon/production」フォルダに移動してから実行お願いします。

例
```
cd production 
fvm flutter run
...
```

## 便利コマンド
### generatorを動かす
```
flutter pub run build_runner build --delete-conflicting-outputs
```

### 起動失敗した時のとりあえずコマンド
```
fvm clean
fvm pub get
fvm flutter run
```

### iOSにデプロイ
TestFlightで試すで良さそう。
xcodeでアーカイブして、配信。
ただし、iOSアプリをメールアドレスやデバイスIDの登録なしに完全に公開することは難しいっぽいので、
やるとしても、チーム内だけで良さそう。

### Androidでデプロイ
以下のコマンドでapkファイル作成し、App Distrubutionで配信

```
fvm flutter build apk --release
```
app/outputs/apk/release/app-release.apkを App Distribution にドラッグ&ドロップでアップロード

参考：https://zenn.dev/heyhey1028/books/flutter-firebase-handson/viewer/wrap_up5


### Webにデプロイ
デモの時に、Webで触ってみたくなった時用
URL:https://flutter-hackathon-prd.web.app/

デプロイされるフォルダ
```
build/web
```

hostingにデプロイする方法
```
fvm flutter build web
firebase deploy 
```

## appid
com.beengineer.prd

## フォルダ関連
主に修正するフォルダ一覧

### assetsフォルダ
画像や音楽などのファイルを置く場所

### libフォルダ
* Models
  * Modelを定義して共通で利用する
* Repositories 
  * Firestoreなど、DBやストレージのデータ操作のRepositoryを作り共通で利用する
* features
  * viewやviewmodelを作る
* themes
  * カラーの定義を格納する場所

## 各種ツール
* Figma Figjam
  * https://www.figma.com/board/qRk15BrIBVZVfyVlSzVvee/Flutter%E3%83%8F%E3%83%83%E3%82%AB%E3%82%BD%E3%83%B3?node-id=0-1&node-type=canvas&t=UFIH7Q4yVg3lmlMW-0
* Figma デザインファイル
  * https://www.figma.com/design/1lLYKPYyIuDSHihGG4bRy4/Flutter%E3%83%8F%E3%83%83%E3%82%AB%E3%82%BD%E3%83%B3?node-id=0-1&t=N7vxdo62veKr0IHl-1
* Github
  * https://github.com/I-Shizu/flutter_hackathon
* firebase
  * https://console.firebase.google.com/u/0/project/flutter-hackathon-prd/overview
* Google Docs(会話のメモなど
  * https://docs.google.com/document/d/1ky1BH8u6BeQuKaUb1gbCuuIs9TKuwS-QPEhCeLxGo1U/edit?tab=t.0


### デザイン関連ツール
* カラー選択
  * https://colorhunt.co/palette/c4e1f6feee91ffbd73ff9d3d
* フリー画像
  * https://undraw.co/illustrations

