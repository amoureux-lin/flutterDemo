import 'package:flutter/material.dart';

class DraggableFab extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Offset initialOffset;
  final double bottomBarHeight; // 👈 新增参数

  const DraggableFab({
    super.key,
    required this.onPressed,
    this.icon = Icons.add,
    this.initialOffset = const Offset(300, 500),
    this.bottomBarHeight = 80.0, // 默认导航栏高度，按实际设置
  });

  @override
  State<DraggableFab> createState() => _DraggableFabState();
}

class _DraggableFabState extends State<DraggableFab> {
  late Offset position;
  static const double fabSize = 56.0;

  @override
  void initState() {
    super.initState();
    position = widget.initialOffset;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    final maxX = size.width - fabSize;
    final maxY = size.height - padding.bottom - widget.bottomBarHeight - fabSize;
    final minY = padding.top;

    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            final newX = (position.dx + details.delta.dx).clamp(0.0, maxX);
            final newY = (position.dy + details.delta.dy).clamp(minY, maxY);
            position = Offset(newX, newY);
          });
        },
        child: FloatingActionButton(
          onPressed: widget.onPressed,
          child: Icon(widget.icon),
        ),
      ),
    );
  }
}
