import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/storage_service.dart';

class SettingsController extends GetxController {
  final StorageService _storageService;

  SettingsController(this._storageService);

  var isAutoDeleteEnabled = false.obs;
  var areNotificationsEnabled = true.obs;
  var isDarkMode = false.obs;
  
  var autoDeleteDelay = '24 hrs'.obs;
  final delayOptions = ['After sharing', '24 hrs', '3 days', '7 days'];

  var reminderTimer = '1 hr'.obs;
  final timerOptions = ['15 min', '30 min', '1 hr', '3 hrs', '24 hrs'];

  @override
  void onInit() {
    super.onInit();
    isAutoDeleteEnabled.value = _storageService.isAutoDeleteEnabled;
    areNotificationsEnabled.value = _storageService.areNotificationsEnabled;
    isDarkMode.value = Get.isDarkMode;
  }

  void toggleAutoDelete(bool value) {
    isAutoDeleteEnabled.value = value;
    _storageService.setAutoDeleteEnabled(value);
  }

  void toggleNotifications(bool value) {
    areNotificationsEnabled.value = value;
    _storageService.setNotificationsEnabled(value);
  }

  void toggleTheme(bool value) {
    isDarkMode.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }

  void scanOldScreenshots() {
    // Implement manual scan
    Get.snackbar('Scan Started', 'Looking for old screenshots...');
  }

  void clearHistory() {
    // Implement history clear
    Get.snackbar('History Cleared', 'Your screenshot history has been reset.');
  }
}
