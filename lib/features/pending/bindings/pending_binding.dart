import 'package:get/get.dart';
import '../controllers/pending_controller.dart';
import '../../../data/repositories/screenshot_repository.dart';
import '../../../domain/usecases/get_pending_screenshots.dart';
import '../../../domain/usecases/keep_screenshot.dart';
import '../../../domain/usecases/delete_screenshot.dart';

class PendingBinding extends Bindings {
  @override
  void dependencies() {
    final repo = Get.find<ScreenshotRepository>();
    Get.lazyPut(() => GetPendingScreenshots(repo));
    Get.lazyPut(() => KeepScreenshot(repo));
    Get.lazyPut(() => DeleteScreenshot(repo));
    Get.lazyPut(() => PendingController(Get.find(), Get.find(), Get.find()));
  }
}
