import 'package:demo/modules/settings/SettingsPage.dart';
import 'package:demo/widgets/KeepAliveWrapper.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../modules/club/ClubPage.dart';
import '../modules/home/HomePage.dart';
import '../modules/mainScaffold.dart';
import '../modules/party/PartyPage.dart';
import '../modules/plaza/PlazaPage.dart';
import '../modules/profile/ProfilePage.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => buildTransitionPage(const HomePage()),
        ),
        GoRoute(
          path: '/party',
          pageBuilder: (context, state) => buildTransitionPage(const PartyPage()),
        ),
        GoRoute(
          path: '/plaza',
          pageBuilder: (context, state) => buildTransitionPage(const KeepAliveWrapper(child: PlazaPage())),
        ),
        GoRoute(
          path: '/club',
          pageBuilder: (context, state) => buildTransitionPage(const ClubPage()),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => buildTransitionPage(const ProfilePage()),
        ),
      ],
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) => buildTransitionPage(const SettingsPage()),
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
