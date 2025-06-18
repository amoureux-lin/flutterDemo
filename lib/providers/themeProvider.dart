import 'package:demo/theme/app_theme_enum.dart';
import 'package:demo/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<AppTheme> {
  static const _key = 'app_theme';
  late SharedPreferences _prefs;

  ThemeNotifier() : super(AppTheme.light) {
    _init();
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    final index = _prefs.getInt(_key);
    if (index != null && index < AppTheme.values.length) {
      state = AppTheme.values[index];
    }
  }

  /// 设置为指定主题
  void setTheme(AppTheme theme) {
    state = theme;
    _prefs.setInt(_key, theme.index);
  }

  /// 循环切换
  void cycleTheme() {
    final next = (state.index + 1) % AppTheme.values.length;
    setTheme(AppTheme.values[next]);
  }

  /// 获取当前 ThemeData（供 UI 使用）
  ThemeData get currentThemeData => appThemes[state]!;
}
