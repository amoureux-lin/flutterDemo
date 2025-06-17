import 'package:flutter/material.dart';

/// 亮色主题配置
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  fontFamily: 'Roboto', // 可替换为你的自定义字体
  colorScheme: ColorScheme.light(
    primary: Colors.blue,
    onPrimary: Colors.white,
    secondary: Colors.amber,
    onSecondary: Colors.black,
    surface: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    onSurface: Colors.black,
  ),
  scaffoldBackgroundColor: Color(0xFFF5F5F5),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
    filled: true,
    fillColor: Colors.white,
    hintStyle: TextStyle(color: Colors.black45),
  ),
  cardTheme: const CardThemeData(
    color: Colors.white,
    elevation: 4,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
  iconTheme: IconThemeData(color: Colors.black87),
  dividerColor: Colors.grey[300],
);


/// 暗色主题配置
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  fontFamily: 'Roboto', // 可替换为你的自定义字体
  colorScheme: ColorScheme.dark(
    primary: Colors.tealAccent,
    onPrimary: Colors.black,
    secondary: Colors.deepOrange,
    onSecondary: Colors.white,
    surface: Color(0xFF1E1E1E),
    background: Color(0xFF121212),
    error: Colors.redAccent,
    onError: Colors.black,
    onSurface: Colors.white,
    onBackground: Colors.white,
  ),
  scaffoldBackgroundColor: Color(0xFF121212),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF1F1F1F),
    foregroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
    filled: true,
    fillColor: Color(0xFF1E1E1E),
    hintStyle: TextStyle(color: Colors.white54),
  ),
  cardTheme: const CardThemeData(
    color: Colors.black54,
    elevation: 4,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.tealAccent,
    foregroundColor: Colors.black,
  ),
  iconTheme: IconThemeData(color: Colors.white70),
  dividerColor: Colors.grey[700],
);
