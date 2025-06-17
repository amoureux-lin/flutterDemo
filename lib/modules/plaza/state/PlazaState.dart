class PlazaState {
  final int count;

  const PlazaState({
    this.count = 0,
  });

  PlazaState copyWith({
    int? count,
  }) {
    return PlazaState(
      count: count ?? this.count,
    );
  }
}
