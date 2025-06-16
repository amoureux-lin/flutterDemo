import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class AppUI {
  /// ✅ 显示确认弹窗，返回 true / false
  static Future<bool> showConfirm(
      BuildContext context, {
        String? title,
        String? content,
        String? cancelText,
        String? confirmText,
      }) async {
    final l10n = AppLocalizations.of(context)!;

    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title ?? l10n.dialogTitle),
        content: Text(content ?? l10n.dialogContent),
        actions: [
          TextButton(
            onPressed: () => closeDialog(context, result: false),
            child: Text(cancelText ?? l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () => closeDialog(context, result: true),
            child: Text(confirmText ?? l10n.confirm),
          ),
        ],
      ),
    );

    return result == true;
  }

  /// ✅ 显示普通提示弹窗（无返回值）
  static Future<void> showAlert(
      BuildContext context, {
        required String title,
        required String content,
        String? confirmText,
        VoidCallback? onConfirm,
      }) async {
    final l10n = AppLocalizations.of(context)!;

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          ElevatedButton(
            onPressed: () {
              closeDialog(context);
              Future.microtask(() => onConfirm?.call());
            },
            child: Text(confirmText ?? l10n.confirm),
          ),
        ],
      ),
    );
  }

  /// ✅ 显示 SnackBar
  static void showSnackbar(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 2),
        Color? backgroundColor,
      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        backgroundColor: backgroundColor,
      ),
    );
  }

  /// ✅ 显示 Loading 遮罩
  static void showLoading(BuildContext context, {String? text}) {
    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 16),
                Text(text ?? l10n.loading),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ✅ 安全关闭 Dialog 或 Loading（防止 pop 报错或白屏）
  static void closeDialog(BuildContext context, {dynamic result}) {
    Navigator.of(context, rootNavigator: true).pop(result);
  }
}
