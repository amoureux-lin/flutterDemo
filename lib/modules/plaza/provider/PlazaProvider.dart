import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/basePageProvider.dart';


final plazaProvider = StateNotifierProvider<PlazaProvider, PageState<List<String>>>(
      (ref) => PlazaProvider(),
);

class PlazaProvider extends BasePageProvider<List<String>> {
  @override
  Future<List<String>> fetchData() {
    // TODO: implement fetchData
    throw UnimplementedError();
  }

}