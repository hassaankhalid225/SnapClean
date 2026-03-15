import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/app.dart';
import 'package:workmanager/workmanager.dart';
import 'core/services/storage_service.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // Background task logic for screenshot detection will be implemented here
    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Get.putAsync(() => StorageService().init());

  // Initialize Workmanager for background tasks
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );

  runApp(const SnapCleanApp());
}
