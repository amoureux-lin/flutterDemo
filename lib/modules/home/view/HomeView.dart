import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../l10n/app_localizations.dart';
import '../../../widgets/appUI.dart';
import '../../../widgets/draggableFab.dart';
import '../provider/HomeProvider.dart';
import '../widget/home_menu_row.dart';
import '../widget/home_user_bar.dart';
import '../widget/party_card.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final controller = ref.read(homeProvider.notifier);
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeUserBar(),
            const SizedBox(height: 16),
            const HomeMenuRow(),
            const SizedBox(height: 16),

            // 随机匹配按钮
            Row(
              children: [
                _buildMatchButton(context, '随机匹配', '游戏派对'),
                const SizedBox(width: 16),
                _buildMatchButton(context, '随机匹配', '对战游戏'),
              ],
            ),

            const SizedBox(height: 16),
            const Text('PLAYER 游乐园', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Row(
              children: [
                SizedBox(width: 10),
                Text('最近常玩', style: TextStyle(fontSize: 12)),
                SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 2.2,
              children: const [
                Image(image: AssetImage('images/home/card.webp')),
                Image(image: AssetImage('images/home/card.webp')),
                Image(image: AssetImage('images/home/card.webp')),
                Image(image: AssetImage('images/home/card.webp')),
              ],
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('精选派对', style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text('派对大厅 >')),
              ],
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.5,
              children: const [
                PartyCard(
                  title: '会演的进！',
                  game: '骰子酒馆',
                  status: '游戏中',
                  online: 60,
                ),
                PartyCard(
                  title: '贪吃蛇大作战来玩',
                  game: '贪吃蛇',
                  status: '准备中',
                  online: 112,
                ),
              ],
            ),
            Text('计数: ${state.count}'),
            ElevatedButton(
              onPressed: controller.increment,
              child: const Text('增加'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchButton(BuildContext context, String title, String subtitle) {
    return Expanded(
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => debugPrint('$title - $subtitle'),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.casino, color: Colors.grey),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                    Text(subtitle),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
