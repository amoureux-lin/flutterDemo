import 'package:demo/widgets/KeepAliveWrapper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../l10n/app_localizations.dart';


class MainScaffold extends StatelessWidget {
  final Widget child;
  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    //多语言引入
    final loc = AppLocalizations.of(context)!;
    final tabs = ['/home', '/party', '/plaza', '/club', '/profile'];

    int currentIndex = tabs.indexWhere((path) => location.startsWith(path));

    return Scaffold(
      body: KeepAliveWrapper(child: child),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex < 0 ? 0 : currentIndex,
        type: BottomNavigationBarType.fixed, // ✅ 必须加这个
        onTap: (index) => context.replace(tabs[index]),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: loc.nav_home),
          BottomNavigationBarItem(icon: Icon(Icons.celebration), label: loc.nav_party),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: loc.nav_plaza),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: loc.nav_club),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: loc.nav_profile),
        ],
      ),
    );
  }
}

