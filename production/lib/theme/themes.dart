import 'package:flutter/material.dart';

// カラーパレットを定義するクラス
// class AppColors {
//   static const primary = Color(0xFFFFC107); // 甘いキャラメルカラー
//   static const primaryContainer = Color(0xFFFFE082); // キャラメルのライトバージョン
//   static const secondary = Color(0xFFF48FB1); // 甘いストロベリーピンク
//   static const secondaryContainer = Color(0xFFF8BBD0); // ライトなストロベリーピンク
//   static const surface = Color(0xFFFFFFFF); // ホワイトチョコレートのような白
//   static const background = Color(0xFFFFF8E1); // クリームのような淡い背景色
//   static const error = Color(0xFFD32F2F); // 赤いベリーのようなエラーカラー
//   static const onPrimary = Color(0xFF000000); // 黒でテキストを見やすく
//   static const onSecondary = Color(0xFFFFFFFF); // 白でピンクの上にテキストを
//   static const onSurface = Color(0xFF4E342E); // ダークチョコレートのようなブラウン
//   static const onBackground = Color(0xFF3E2723); // 背景上のダークカラー
//   static const onError = Color(0xFFFFFFFF); // エラーカラーの上で見やすい白
// }

// // クールな色合いのカラーパレットを定義するクラス
// class AppColors {
//   static const primary = Color(0xFF0D47A1); // ダークブルー
//   static const primaryContainer = Color(0xFF5472D3); // ライトブルー
//   static const secondary = Color(0xFF00ACC1); // クールなシアン
//   static const secondaryContainer = Color(0xFF80DEEA); // ライトシアン
//   static const surface = Color(0xFFECEFF1); // 明るいグレー
//   static const background = Color(0xFFCFD8DC); // 淡いグレーブルー
//   static const error = Color(0xFFB71C1C); // ディープレッド（エラー）
//   static const onPrimary = Color(0xFFFFFFFF); // 白でテキストを見やすく
//   static const onSecondary = Color(0xFF000000); // シアン上の黒テキスト
//   static const onSurface = Color(0xFF37474F); // ダークグレー
//   static const onBackground = Color(0xFF263238); // 背景上のダークカラー
//   static const onError = Color(0xFFFFFFFF); // エラーカラーの上で見やすい白
// }

// 落ち着いた色合いのカラーパレットを定義するクラス
class AppColors {
  static const primary = Color(0xFF4E6E58); // 落ち着いた深いグリーン
  static const primaryContainer = Color(0xFFA5B8A8); // ソフトなミントグリーン
  static const secondary = Color(0xFF8D6E63); // シックなブラウン
  static const secondaryContainer = Color(0xFFD7CCC8); // ライトブラウン
  static const surface = Color(0xFFF5F5F5); // 明るいグレージュ
  static const background = Color(0xFFECE8E1); // 優しいクリームベージュ
  static const error = Color(0xFFD32F2F); // 控えめなレッド（エラー）
  static const onPrimary = Color(0xFFFFFFFF); // グリーン上での白
  static const onSecondary = Color(0xFFFFFFFF); // ブラウン上での白
  static const onSurface = Color(0xFF5D4037); // 深みのあるブラウン
  static const onBackground = Color(0xFF3E2723); // 背景上での深いブラウン
  static const onError = Color(0xFFFFFFFF); // エラーカラー上での白
}

// アプリ全体のテーマを設定するクラス
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      primaryContainer: AppColors.primaryContainer,
      secondary: AppColors.secondary,
      secondaryContainer: AppColors.secondaryContainer,
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onSurface: AppColors.onSurface,
      onError: AppColors.onError,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      iconTheme: IconThemeData(color: AppColors.onPrimary),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.onPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondary,
      foregroundColor: AppColors.onSecondary,
      elevation: 1,
    ),
    cardTheme: CardTheme(
      color: AppColors.surface,
      elevation: 0,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.background,
      titleTextStyle: const TextStyle(
        color: AppColors.onBackground,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: const TextStyle(
        color: AppColors.onBackground,
        fontSize: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primary,
      selectedItemColor: AppColors.onPrimary,
      unselectedItemColor: AppColors.onPrimary.withOpacity(0.7),
      selectedIconTheme: const IconThemeData(size: 28),
      unselectedIconTheme: const IconThemeData(size: 24),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.primaryContainer,
      labelStyle: const TextStyle(color: AppColors.onPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.onBackground,
      size: 24,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.onBackground),
      bodyMedium: TextStyle(color: AppColors.onBackground),
      titleLarge: TextStyle(color: AppColors.onBackground),
    ),
  );
}
