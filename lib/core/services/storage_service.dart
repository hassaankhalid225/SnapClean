import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

class StorageService extends GetxService {
  late SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  bool get isFirstLaunch => _prefs.getBool(AppConstants.isFirstLaunchKey) ?? true;
  Future<void> setFirstLaunch(bool value) async => _prefs.setBool(AppConstants.isFirstLaunchKey, value);

  bool get isAutoDeleteEnabled => _prefs.getBool(AppConstants.autoDeleteEnabledKey) ?? false;
  Future<void> setAutoDeleteEnabled(bool value) async => _prefs.setBool(AppConstants.autoDeleteEnabledKey, value);

  bool get areNotificationsEnabled => _prefs.getBool(AppConstants.notificationsEnabledKey) ?? true;
  Future<void> setNotificationsEnabled(bool value) async => _prefs.setBool(AppConstants.notificationsEnabledKey, value);
}
