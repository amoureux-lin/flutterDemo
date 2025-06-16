import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/basePageProvider.dart';

final partyProvider = StateNotifierProvider<PartyProvider, PageState<List<String>>>(
      (ref) => PartyProvider(),
);

class PartyProvider extends BasePageProvider<List<String>> {
  @override
  Future<List<String>> fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    return ['推荐 A', '推荐 B', '推荐 C'];
  }
}
