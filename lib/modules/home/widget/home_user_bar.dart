
import 'package:flutter/material.dart';

class HomeUserBar extends StatelessWidget {
  const HomeUserBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey[300],
          backgroundImage: const AssetImage('images/home/avatar.jpg'),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('月落乌啼', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Row(
                children: [
                  Text('金币: 10000', style: TextStyle(color: Colors.orange)),
                  Icon(Icons.add_circle, size: 16, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(75),
          onTap: () => debugPrint("搜索"),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).hoverColor,
              borderRadius: BorderRadius.circular(75),
            ),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search, color: Colors.grey),
                Text('搜索', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
