import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/network/DioClient.dart';
import '../core/network/auth_storage.dart';
import '../models/user.dart';

final authProvider = AsyncNotifierProvider<AuthNotifier, User?>(
  AuthNotifier.new,
);

class AuthNotifier extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() async {
    final token = await AuthStorage.getToken();
    if (token != null) {
      return await fetchUserInfo();
    } else {
      return await guestLogin(); // 匿名登录
    }
  }

  Future<User> guestLogin() async {
    final dio = DioClient.create();
    final res = await dio.post('/auth/guest');
    final token = res.data['token'];
    await AuthStorage.saveToken(token);
    final user = User.fromJson(res.data['user']);
    state = AsyncData(user);
    return user;
  }

  Future<User> fetchUserInfo() async {
    final dio = DioClient.create();
    final res = await dio.get('/auth/profile');
    final user = User.fromJson(res.data);
    state = AsyncData(user);
    return user;
  }
}
