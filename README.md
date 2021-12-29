# first_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# first-app-flutter

#AR手順

##1

/pubspec.yaml に
`dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  arcore_flutter_plugin: ^0.0.2+2   //追記
  `

コマンド実行
`$ flutter pub get`

##2

/android/app/build.gradle に追記変更
`
android {
    // compileSdkVersionの指定はもともとあるはず
    compileSdkVersion 28

    // 省略

    // compileOptionsの指定は追加する
    compileOptions {
        sourceCompatibility 1.8
        targetCompatibility 1.8
    }

    // defaultConfigのminSdkVersion指定を24に書き換える
    defaultConfig {
        // 省略
        minSdkVersion 24
        // 省略
    }

    // 省略
}

// もともとあるdependenciesの指定に以下の3行を追加する
dependencies {
    // 省略
    implementation 'com.google.ar.sceneform.ux:sceneform-ux:1.8.0'
    implementation 'com.google.ar.sceneform:core:1.8.0'
    implementation 'com.google.ar:core:1.8.0'
}
`

##3
/android/app/src/main/AndroidManifest.xml に追記
manifest直下に
`
<uses-sdk android:minSdkVersion="24" />
<uses-permission android:name="android.permission.CAMERA" />
<uses-feature android:name="android.hardware.camera.ar" />
`
<meta-data　android:name="flutterEmbedding"　android:value="2"/> の下に
`
<meta-data android:name="com.google.ar.core" android:value="optional" />
`

##4
https://www.manektech.com/blog/build-augmented-reality-ar-application-in-flutter
上記のURLのステップ5からを参考にmain.dartになどに記載する

## null safety バグ
arcore_flutter_pluginが　古い感じなのかエラー吐くので下記のイシューで対応

https://github.com/dart-lang/language/issues/1475

