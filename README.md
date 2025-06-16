
# 🎮 Flutter 游戏大厅 App

这是一个基于 Flutter 构建的游戏大厅风格 App，支持多语言、主题切换、动态内容、页面状态管理与拖动按钮等功能。采用 `Riverpod` + `GoRouter` 构建模块化结构，适用于 Web 和移动端。

---

## 📁 项目结构

```bash
demo/
├── lib/
│   ├── app.dart                 # App 启动配置，包含 MaterialApp.router
│   ├── main.dart                # 应用入口，封装 ProviderScope
│   ├── routes/router.dart       # 路由表配置，使用 GoRouter
│   ├── modules/                # 页面模块
│   │   ├── home/               # 首页模块
│   │   │   ├── home_page.dart
│   │   │   ├── home_view.dart
│   │   │   └── home_provider.dart
│   │   ├── profile/
│   │   │   ├── profile_page.dart
│   │   │   ├── settings_page.dart
│   ├── theme/theme_provider.dart # Riverpod 管理主题模式
│   ├── providers/              # 多语言状态 / 全局状态
│   ├── utils/app_ui.dart       # App 弹窗封装类
│   └── widgets/                # 通用组件（如 DraggableFab）
├── pubspec.yaml                # 依赖声明及配置
├── l10n.yaml                   # 多语言配置
```

---

## 🚀 技术栈

- [x] Flutter 3.x
- [x] Riverpod 2.x – 状态管理
- [x] GoRouter – 路由系统
- [x] shared_preferences – 主题/语言持久化
- [x] flutter_localizations – 多语言支持
- [x] 自定义组件：可拖动按钮、弹窗工具类

---

## 🌐 多语言

配置见：
- `l10n.yaml` 配置文件
- `lib/l10n/*.arb` 多语言文案
- 使用 `AppLocalizations.of(context)` 获取本地化字符串

```dart
Text(AppLocalizations.of(context)!.home);
```

---

## 🎨 主题管理

通过 `theme_provider.dart` 使用 Riverpod 管理 `ThemeMode`，支持明亮 / 暗色模式自动切换 + 持久化。

```dart
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});
```

---

## 🧭 页面导航

使用 `GoRouter` 配置 ShellRoute 作为底部导航容器，所有页面共享主导航栏：

```dart
GoRouter(
  routes: [
    ShellRoute(
      builder: (_, __, child) => MainScaffold(child: child),
      routes: [
        GoRoute(path: '/home', builder: (_) => const HomePage()),
        ...
      ],
    )
  ]
)
```

---

## 🧩 弹窗工具 AppUI

统一封装的弹窗、提示、Loading 工具：

```dart
AppUI.showConfirm(context, title: '提示', content: '确认操作？');
AppUI.showAlert(context, title: '完成', content: '保存成功');
AppUI.showLoading(context, text: '加载中...');
AppUI.closeDialog(context);
AppUI.showSnackbar(context, '操作成功');
```

---

## 🧪 页面结构推荐

每个页面模块包括：

- `xxx_page.dart`：页面容器（含 Scaffold）
- `xxx_view.dart`：展示区域组件（支持复用）
- `xxx_provider.dart`：状态管理（Riverpod）

---

## ✅ 启动指南

```bash
flutter pub get
flutter gen-l10n
flutter run -d chrome # 或 Android/iOS
```

---

## 📦 本地化与主题持久化依赖

请确保已启用：

```yaml
flutter:
  generate: true

dependencies:
  flutter_localizations:
    sdk: flutter
  shared_preferences:
```

---

## ✨ TODO

- [ ] 接入后端数据接口
- [ ] 增加俱乐部、派对、广场功能页逻辑
- [ ] 单元测试 + 自动化测试集成

---

## 📄 License

MIT
