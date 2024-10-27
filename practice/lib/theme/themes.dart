import 'package:flutter/material.dart';

// カラーパレットを定義するクラス
class AppColors {
  static const primary = Color(0xFFFFC107); // 甘いキャラメルカラー
  static const primaryContainer = Color(0xFFFFE082); // キャラメルのライトバージョン
  static const secondary = Color(0xFFF48FB1); // 甘いストロベリーピンク
  static const secondaryContainer = Color(0xFFF8BBD0); // ライトなストロベリーピンク
  static const surface = Color(0xFFFFFFFF); // ホワイトチョコレートのような白
  static const background = Color(0xFFFFF8E1); // クリームのような淡い背景色
  static const error = Color(0xFFD32F2F); // 赤いベリーのようなエラーカラー
  static const onPrimary = Color(0xFF000000); // 黒でテキストを見やすく
  static const onSecondary = Color(0xFFFFFFFF); // 白でピンクの上にテキストを
  static const onSurface = Color(0xFF4E342E); // ダークチョコレートのようなブラウン
  static const onBackground = Color(0xFF3E2723); // 背景上のダークカラー
  static const onError = Color(0xFFFFFFFF); // エラーカラーの上で見やすい白
}

// アプリ全体のテーマを設定するクラス
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      primaryContainer: AppColors.primaryContainer,
      secondary: AppColors.secondary,
      secondaryContainer: AppColors.secondaryContainer,
      surface: AppColors.surface,
      background: AppColors.background,
      error: AppColors.error,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onSurface: AppColors.onSurface,
      onBackground: AppColors.onBackground,
      onError: AppColors.onError,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      iconTheme: IconThemeData(color: AppColors.onPrimary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.onBackground),
      bodyMedium: TextStyle(color: AppColors.onBackground),
      titleLarge: TextStyle(color: AppColors.onBackground),
    ),
  );
}
