import 'package:demo/theme/app_theme_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/localeProvider.dart';
import '../../providers/themeProvider.dart';
import '../../widgets/appUI.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(themeProvider);
    final notifier = ref.read(themeProvider.notifier);

    final locale = ref.watch(localeProvider);
    final loc = AppLocalizations.of(context)!;

    String getThemeLabel(ThemeMode mode) {
      switch (mode) {
        case ThemeMode.light:
          return loc.theme_light;
        case ThemeMode.dark:
          return loc.theme_dark;
        case ThemeMode.system:
        default:
          return loc.theme_system;
      }
    }

    String getLocaleLabel(Locale? locParam) {
      if (locParam?.languageCode == 'en') return loc.lang_en;
      return loc.lang_zh;
    }

    return Scaffold(
      appBar: AppBar(title: Text(loc.settings_title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                Text("当前主题: ${current.label}"),
                DropdownButton<AppTheme>(
                  value: current,
                  items: AppTheme.values.map((theme) {
                    return DropdownMenuItem<AppTheme>(
                      value: theme,
                      child: Text(theme.label),
                    );
                  }).toList(),
                  onChanged: (theme) {
                    if (theme != null) notifier.setTheme(theme);
                  },
                ),
                ElevatedButton(
                  onPressed: notifier.cycleTheme,
                  child: const Text("循环切换主题"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Text(loc.locale_label),
              subtitle: Text(getLocaleLabel(locale)),
              trailing: ElevatedButton(
                onPressed: () {
                  final next = (locale?.languageCode == 'en')
                      ? const Locale('zh')
                      : const Locale('en');
                  // 切换语言
                  ref.read(localeProvider.notifier).set(next);
                },
                child: Text(loc.locale_button),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      AppUI.showSnackbar(context, '这是一条提示');
                    },
                    child: const Text('显示 SnackBar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AppUI.showAlert(
                        context,
                        title: '操作成功',
                        content: '你的请求已完成',
                      );
                    },
                    child: const Text('显示提示弹窗'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final ok = await AppUI.showConfirm(
                        context,
                        title: '删除确认',
                        content: '你确定要删除该项吗？',
                      );
                      AppUI.showSnackbar(context, ok ? '点击了确定' : '点击了取消');
                    },
                    child: const Text('显示确认弹窗'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      AppUI.showLoading(context, text: '处理中...');
                      await Future.delayed(const Duration(seconds: 2));
                      AppUI.closeDialog(context);
                    },
                    child: const Text('显示 Loading 遮罩'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
