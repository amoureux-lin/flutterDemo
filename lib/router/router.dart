import 'package:demo/modules/settings/SettingsPage.dart';
import 'package:demo/widgets/KeepAliveWrapper.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../SplashPage.dart';
import '../modules/club/ClubPage.dart';
import '../modules/home/HomePage.dart';
import '../modules/mainScaffold.dart';
import '../modules/party/PartyPage.dart';
import '../modules/plaza/PlazaPage.dart';
import '../modules/profile/ProfilePage.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: '/splash',
  routes: [
    /// ✅ 独立启动页（不属于 ShellRoute 管辖范围）
    GoRoute(
      path: '/splash',
      pageBuilder: (context, state) =>
          buildTransitionPage(const SplashPage()),
    ),

    /// ✅ ShellRoute 下的主导航页面，挂在 /main 下
    ShellRoute(
      builder: (context, state, child) => MainScaffold(child: child),
      routes: [
        GoRoute(
          path: '/main/home',
          pageBuilder: (context, state) =>
              buildTransitionPage(const HomePage()),
        ),
        GoRoute(
          path: '/main/party',
          pageBuilder: (context, state) =>
              buildTransitionPage(const PartyPage()),
        ),
        GoRoute(
          path: '/main/plaza',
          pageBuilder: (context, state) => buildTransitionPage(
              const KeepAliveWrapper(child: PlazaPage())),
        ),
        GoRoute(
          path: '/main/club',
          pageBuilder: (context, state) =>
              buildTransitionPage(const ClubPage()),
        ),
        GoRoute(
          path: '/main/profile',
          pageBuilder: (context, state) =>
              buildTransitionPage(const ProfilePage()),
        ),
      ],
    ),

    /// ✅ 设置页，非主导航项
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) =>
          buildTransitionPage(const SettingsPage()),
    ),
  ],
);

CustomTransitionPage buildTransitionPage(Widget child) {
  return CustomTransitionPage(
    key: ValueKey(child.hashCode), // 确保动画生效
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}
