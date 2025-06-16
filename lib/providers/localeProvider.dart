import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>(
      (ref) => LocaleNotifier(),
);

class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier() : super(null) {
    _loadFromPrefs();
  }

  void set(Locale locale) {
    state = locale;
    _saveToPrefs(locale);
  }

  Future<void> _saveToPrefs(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('locale_code', locale.languageCode);
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString('locale_code');
    if (code != null) {
      state = Locale(code);
    }
  }
}
