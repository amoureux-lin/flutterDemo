import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/HomeState.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeState>(
      (ref) => HomeProvider(),
);

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider() : super(const HomeState(isLoading: true)) {
    loadData();
  }

  Future<void> loadData() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      // 模拟加载数据
      await Future.delayed(const Duration(seconds: 1));
      final items = ['推荐 A', '推荐 B', '推荐 C'];
      state = state.copyWith(isLoading: false, data: items);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e);
    }
  }

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }

  void refresh() => loadData();
}
