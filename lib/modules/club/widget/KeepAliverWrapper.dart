import 'package:flutter/cupertino.dart';

class KeepAliveWrapper extends StatefulWidget {
  final Widget? child;
  final bool keepAlive;

  const KeepAliveWrapper(
      {super.key, @required this.child, this.keepAlive = true});

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    // TODO: implement didUpdateWidget
    if (oldWidget.keepAlive != widget.keepAlive) {
      print("keepAlive 状态需要更新");
// keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中 updateKeepAlive();
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }
}
