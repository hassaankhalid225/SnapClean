import 'package:get/get.dart';
import '../../../domain/usecases/get_pending_screenshots.dart';
import '../../../domain/usecases/keep_screenshot.dart';
import '../../../domain/usecases/delete_screenshot.dart';
import '../../../domain/entities/screenshot_entity.dart';

class PendingController extends GetxController {
  final GetPendingScreenshots _getPending;
  final KeepScreenshot _keepScreenshot;
  final DeleteScreenshot _deleteScreenshot;

  PendingController(this._getPending, this._keepScreenshot, this._deleteScreenshot);

  var isLoading = true.obs;
  var pendingScreenshots = <ScreenshotEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    try {
      final data = await _getPending.call();
      pendingScreenshots.assignAll(data);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> keepScreenshot(int id) async {
    await _keepScreenshot.call(id);
    pendingScreenshots.removeWhere((s) => s.id == id);
  }

  Future<void> deleteScreenshot(int id) async {
    await _deleteScreenshot.call(id);
    pendingScreenshots.removeWhere((s) => s.id == id);
  }
}
