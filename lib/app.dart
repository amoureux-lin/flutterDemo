import 'package:demo/providers/localeProvider.dart';
import 'package:demo/providers/themeProvider.dart';
import 'package:demo/theme/app_theme_enum.dart';
import 'package:demo/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'router/router.dart';

class MyApp extends ConsumerWidget  {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(themeProvider);
    final themeData = appThemes[appTheme]!;
    final locale = ref.watch(localeProvider);
    return MaterialApp.router(
        theme: themeData,
        darkTheme: appThemes[AppTheme.dark],
        themeMode: ThemeMode.light, // 如果你用自定义主题就不要 ThemeMode.system
        locale: locale,
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