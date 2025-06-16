import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() {
  runApp(
    const ProviderScope( // ✅ 这一步是必须的
      child: MyApp(),
    ),
  );
}

