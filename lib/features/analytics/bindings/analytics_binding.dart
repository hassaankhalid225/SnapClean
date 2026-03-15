import 'package:get/get.dart';
import '../controllers/analytics_controller.dart';
import '../../../data/repositories/screenshot_repository.dart';
import '../../../domain/usecases/get_analytics.dart';

class AnalyticsBinding extends Bindings {
  @override
  void dependencies() {
    final repo = Get.find<ScreenshotRepository>();
    Get.lazyPut(() => GetAnalytics(repo));
    Get.lazyPut(() => AnalyticsController(Get.find()));
  }
}
