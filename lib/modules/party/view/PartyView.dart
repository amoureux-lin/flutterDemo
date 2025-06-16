import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../widgets/appUI.dart';
import '../../../widgets/draggableFab.dart';
import '../provider/PartyProvider.dart';

class PartyView extends ConsumerWidget {
  const PartyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(partyProvider);
    final controller = ref.read(partyProvider.notifier);

    Widget body;

    if (state.isLoading) {
      body = const Center(child: CircularProgressIndicator());
    } else if (state.error != null) {
      body = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('加载失败：${state.error}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.refresh,
              child: const Text('重试'),
            )
          ],
        ),
      );
    } else if (state.data == null || state.data!.isEmpty) {
      body = const Center(child: Text('暂无数据'));
    } else {
      body = RefreshIndicator(
        onRefresh: controller.refresh,
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: state.data!.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: const Icon(Icons.star),
                title: Text(state.data![index]),
              ),
            );
          },
        ),
      );
    }

    return Stack(
      children: [
        body,
        DraggableFab(
          onPressed: () => print('点击 FAB'),
          bottomBarHeight: kBottomNavigationBarHeight+56, // Flutter 默认值为 56
        ),

      ],
    );
  }
}
