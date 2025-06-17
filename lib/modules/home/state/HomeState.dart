class HomeState {
  final bool isLoading;
  final List<String> data;
  final Object? error;
  final int count;

  const HomeState({
    this.isLoading = false,
    this.data = const [],
    this.error,
    this.count = 0,
  });

  HomeState copyWith({
    bool? isLoading,
    List<String>? data,
    Object? error,
    int? count,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error ?? this.error,
      count: count ?? this.count,
    );
  }
}
