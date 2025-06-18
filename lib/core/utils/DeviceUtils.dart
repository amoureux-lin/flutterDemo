import 'dart:convert';
import 'dart:typed_data';
import 'package:web/web.dart';
import 'package:crypto/crypto.dart';
import 'dart:js_interop';

import 'package:universal_platform/universal_platform.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _uuidKey = 'device_uuid';

Future<String> getDeviceUniqueId() async {
  final deviceInfo = DeviceInfoPlugin();

  if (UniversalPlatform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    return androidInfo.id ?? 'unknown_android_id';
  } else if (UniversalPlatform.isIOS) {
    final iosInfo = await deviceInfo.iosInfo;
    return iosInfo.identifierForVendor ?? 'unknown_ios_id';
  } else if (UniversalPlatform.isWeb) {
    final uuid = await getCanvasFingerprint();
    return 'web_device_$uuid';
  } else {
    return 'unsupported';
  }
}

Future<String> getOrCreateUUID() async {
  final prefs = await SharedPreferences.getInstance();
  String? uuid = prefs.getString(_uuidKey);

  if (uuid == null || uuid.isEmpty) {
    uuid = const Uuid().v4();
    await prefs.setString(_uuidKey, uuid);
  }

  return uuid;
}


/// 获取稳定的浏览器指纹（不缓存，但每次都一致）
Future<String> getCanvasFingerprint() async {
  final canvas = HTMLCanvasElement();
  canvas.width = 200;
  canvas.height = 50;

  final ctx = canvas.getContext('2d') as CanvasRenderingContext2D;

  ctx.font = '14px Arial'.toJS as String;
  ctx.fillStyle = '#f60'.toJS;
  ctx.fillRect(125, 1, 62, 20);
  ctx.fillStyle = '#069'.toJS;
  ctx.fillText('flutter-fingerprint'.toJS as String, 2, 15);
  ctx.fillStyle = 'rgba(102, 204, 0, 0.7)'.toJS;
  ctx.fillText('flutter-fingerprint'.toJS as String, 4, 17);

  final imageData = ctx.getImageData(0, 0, canvas.width.toInt(), canvas.height.toInt());
  final bytes = Uint8List.fromList(imageData.data.toDart); // imageData.data 仍然是 JS 类型，需要 .toDart

  final String ua = window.navigator.userAgent ?? '';
  final String lang = window.navigator.language ?? '';

  final screen = window.screen;
  // *** 关键修改：移除 .toDart，因为 screen.width 和 screen.height 现在直接是 Dart int 类型 ***
  final resolution = '${screen.width}x${screen.height}';
  final timezone = DateTime.now().timeZoneOffset.inMinutes.toString();

  final buffer = <int>[]
    ..addAll(utf8.encode('$ua|$lang|$resolution|$timezone'))
    ..addAll(bytes);

  return sha256.convert(buffer).toString();
}