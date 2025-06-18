import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth_provider.dart'; // 确保导入

class ProfilePage extends ConsumerWidget {
    const ProfilePage({super.key});

    _goToSettings(context) {
      context.push('/settings'); // 🔁 跳转到设置页面
    }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final userAsync = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("个人中心"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: (){
              _goToSettings(context);
            },
          ),
        ],
      ),
      body: userAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (err, stack) => Center(
          child: Text("登录失败：$err"),
        ),

        data: (user) {
          if (user == null) {
            return const Center(child: Text("未登录"));
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("欢迎你：${user.nickname}"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // 示例操作：重新登录为游客
                    ref.read(authProvider.notifier).guestLogin();
                  },
                  child: const Text("重新作为游客登录"),
                )
              ],
            ),
          );
        },
      )
    );
  }
}
