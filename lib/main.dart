import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/utils/DeviceUtils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env"); // 默认是 .env
  final deviceId = await getDeviceUniqueId();
  String fingerprint = await getCanvasFingerprint();
  print('唯一ID Device ID: $deviceId');
  print(fingerprint);
  runApp(
    const ProviderScope( // ✅ 这一步是必须的
      child: MyApp(),
    ),
  );
}

