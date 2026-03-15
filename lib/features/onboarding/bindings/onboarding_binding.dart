import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../../core/services/storage_service.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController(Get.find()));
  }
}
