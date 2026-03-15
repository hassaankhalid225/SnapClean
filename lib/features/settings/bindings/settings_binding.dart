import 'package:get/get.dart';
import '../controllers/settings_controller.dart';
import '../../../core/services/storage_service.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController(Get.find()));
  }
}
