
import 'package:flutter/material.dart';

class HomeMenuRow extends StatelessWidget {
  const HomeMenuRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        HomeIconButton(label: '排行榜', icon: Icons.leaderboard),
        HomeIconButton(label: '任务', icon: Icons.assignment),
        HomeIconButton(label: '商城', icon: Icons.store),
        HomeIconButton(label: '好友在玩', icon: Icons.people),
      ],
    );
  }
}

class HomeIconButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;

  const HomeIconButton({
    super.key,
    required this.label,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
