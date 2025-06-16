import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
      (ref) => ThemeModeNotifier(),
);

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadFromPrefs();
  }

  void set(ThemeMode mode) {
    state = mode;
    _saveToPrefs(mode);
  }

  Future<void> _saveToPrefs(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('theme_mode', mode.name);
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('theme_mode');
    if (value != null) {
      state = ThemeMode.values.firstWhere((e) => e.name == value, orElse: () => ThemeMode.system);
    }
  }
}
