import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 通用页面状态
class PageState<T> {
  final T? data;
  final bool isLoading;
  final String? error;

  const PageState({
    this.data,
    this.isLoading = false,
    this.error,
  });

  PageState<T> copyWith({
    T? data,
    bool? isLoading,
    String? error,
  }) {
    return PageState<T>(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// 通用页面 Provider 控制器
abstract class BasePageProvider<T> extends StateNotifier<PageState<T>> {
  BasePageProvider() : super(PageState<T>()) {
    loadData(); // 初始化加载
  }

  Future<T> fetchData();

  Future<void> loadData() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = await fetchData();
      state = PageState(data: data, isLoading: false);
    } catch (e) {
      state = PageState(data: null, isLoading: false, error: e.toString());
    }
  }

  Future<void> refresh() => loadData();
}
