import 'package:demo/providers/localeProvider.dart';
import 'package:demo/providers/themeProvider.dart';
import 'package:demo/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'router/router.dart';

class MyApp extends ConsumerWidget  {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);
    return MaterialApp.router(
      theme: lightTheme, // 亮色主题
      darkTheme: darkTheme, // 暗色主题（可选）
      locale: locale, // 默认语言
      themeMode: themeMode, // 跟随系统，或设置为 ThemeMode.light / dark
      routerConfig: routerConfig,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // 英文
        Locale('zh'), // 简体中文
      ],
        debugShowCheckedModeBanner:false
    );
  }
}