import 'package:get/get.dart';
import '../controllers/gallery_controller.dart';
import '../../../data/repositories/screenshot_repository.dart';
import '../../../domain/usecases/delete_screenshot.dart';

class GalleryBinding extends Bindings {
  @override
  void dependencies() {
    final repo = Get.find<ScreenshotRepository>();
    Get.lazyPut(() => DeleteScreenshot(repo));
    Get.lazyPut(() => GalleryController(repo, Get.find()));
  }
}
