import 'package:flutter/material.dart';
import 'app_theme_enum.dart';
import 'light_theme.dart';
import 'dark_theme.dart';
import 'blue_theme.dart';
import 'green_theme.dart';
import 'pink_theme.dart';

final appThemes = <AppTheme, ThemeData>{
  AppTheme.light: lightTheme,
  AppTheme.dark: darkTheme,
  AppTheme.blue: blueTheme,
  AppTheme.green: greenTheme,
  AppTheme.pink: pinkTheme,
};
