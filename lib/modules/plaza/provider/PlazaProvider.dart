import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/PlazaState.dart';

final plazaProvider = StateNotifierProvider<PlazaProvider, PlazaState>(
      (ref) => PlazaProvider(),
);

class PlazaProvider extends StateNotifier<PlazaState> {
  PlazaProvider() : super(const PlazaState());
  
  void increment() {
    state = state.copyWith(count: state.count + 1);
  }
}
