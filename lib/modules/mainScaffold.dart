import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';
import '../widgets/KeepAliveWrapper.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;
  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final loc = AppLocalizations.of(context)!;

    // 定义 tab 路由
    final tabs = ['/main/home', '/main/party', '/main/plaza', '/main/club', '/main/profile'];

    // 匹配当前路径对应 tab 索引
    final currentIndex = tabs.indexWhere((path) => location.startsWith(path));

    return Scaffold(
      body: KeepAliveWrapper(child: child),

      // ✅ 仅在有效 tab 页面才显示 bottom nav
      bottomNavigationBar: currentIndex == -1
          ? null
          : BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          final target = tabs[index];
          print("target:$target");
          if (!location.startsWith(target)) {
            context.go(target); // ✅ go 替代 replace
          }
        },
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
