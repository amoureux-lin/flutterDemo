import 'package:demo/modules/plaza/provider/PlazaProvider.dart';
import 'package:demo/modules/plaza/widget/AttentionView.dart';
import 'package:demo/modules/plaza/widget/RecommendView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/app_localizations.dart';

  class PlazaView extends ConsumerWidget {
  const PlazaView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final state = ref.watch(plazaProvider);
  final controller = ref.read(plazaProvider.notifier);
  final loc = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Container(
                width: 150,
                alignment: Alignment.center,
                child: const TabBar(
                  labelPadding: EdgeInsets.symmetric(horizontal: 8),
                  unselectedLabelColor: Color.fromARGB(255, 94, 93, 93),
                  labelColor: Colors.black,
                  indicatorColor: Color.fromARGB(255, 243, 149, 42),
                  overlayColor: WidgetStateColor.transparent,
                  tabAlignment: TabAlignment.center,
                  splashFactory: NoSplash.splashFactory,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(text: "推荐"),
                    Tab(text: "关注"),
                  ],
                  labelStyle: TextStyle(fontSize: 17), // 选中时文字大小
                  unselectedLabelStyle: TextStyle(fontSize: 17),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search,color: Colors.amber),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.message,color: Colors.amber),
                  onPressed: () {
                  },
                ),
              ],
            ),
            body: const TabBarView(
              children: [RecommendView(), AttentionView()],
            ),
          ),
        ),
      ),
    );
  }
}


