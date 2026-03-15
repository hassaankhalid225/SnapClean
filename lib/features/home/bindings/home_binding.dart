import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../data/repositories/screenshot_repository.dart';
import '../../../domain/usecases/get_analytics.dart';
import '../../../domain/usecases/get_pending_screenshots.dart';
import '../../../domain/usecases/keep_screenshot.dart';
import '../../../domain/usecases/delete_screenshot.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final repo = Get.find<ScreenshotRepository>();

    Get.lazyPut(() => GetAnalytics(repo));
    Get.lazyPut(() => GetPendingScreenshots(repo));
    Get.lazyPut(() => KeepScreenshot(repo));
    Get.lazyPut(() => DeleteScreenshot(repo));

    Get.lazyPut(() => HomeController(
      Get.find(),
      Get.find(),
      Get.find(),
      Get.find(),
    ));
  }
}
