import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionHandler {
  static Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      final photos = await Permission.photos.request();
      if (photos.isGranted) return true;
    }
    final status = await Permission.storage.request();
    return status.isGranted;
  }

  static Future<bool> requestNotificationPermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.notification.request();
      return status.isGranted;
    }
    return true; // iOS handles notification permission differently (via local_notifications usually or APNS)
  }
}
