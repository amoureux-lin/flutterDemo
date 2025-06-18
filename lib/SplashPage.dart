import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  bool _navigated = false;

  void _maybeNavigate(AsyncValue auth) {
    if (_navigated) return;

    auth.when(
      data: (_) {
        _navigated = true;
        Future.microtask(() {
          context.go('/main/home');
        });
      },
      error: (_, __) {
        _navigated = true;
        Future.microtask(() {
          context.go('/main/home'); // 或跳转到错误页
        });
      },
      loading: () {}, // 等待中什么都不做
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.listen(authProvider, (prev, next) {
        _maybeNavigate(next);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    _maybeNavigate(auth); // ✅ 这里也需要检查，防止监听前就完成
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
