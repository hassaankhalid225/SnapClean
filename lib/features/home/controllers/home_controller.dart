import 'package:get/get.dart';
import '../../../domain/usecases/get_analytics.dart';
import '../../../domain/usecases/get_pending_screenshots.dart';
import '../../../domain/usecases/keep_screenshot.dart';
import '../../../domain/usecases/delete_screenshot.dart';
import '../../../domain/entities/screenshot_entity.dart';

class HomeController extends GetxController {
  final GetAnalytics _getAnalytics;
  final GetPendingScreenshots _getPendingScreenshots;
  final KeepScreenshot _keepScreenshot;
  final DeleteScreenshot _deleteScreenshot;

  HomeController(
    this._getAnalytics,
    this._getPendingScreenshots,
    this._keepScreenshot,
    this._deleteScreenshot,
  );

  var isLoading = true.obs;
  var pendingScreenshots = <ScreenshotEntity>[].obs;
  
  var totalTaken = 0.obs;
  var storageFreed = 0.obs;
  var pendingCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    try {
      final analytics = await _getAnalytics.call();
      totalTaken.value = analytics['totalTaken'] ?? 0;
      storageFreed.value = analytics['storageFreed'] ?? 0;

      final pending = await _getPendingScreenshots.call();
      pendingScreenshots.assignAll(pending);
      pendingCount.value = pending.length;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> keepScreenshot(int id) async {
    await _keepScreenshot.call(id);
    pendingScreenshots.removeWhere((s) => s.id == id);
    pendingCount.value = pendingScreenshots.length;
  }

  Future<void> deleteScreenshot(int id) async {
    await _deleteScreenshot.call(id);
    pendingScreenshots.removeWhere((s) => s.id == id);
    pendingCount.value = pendingScreenshots.length;
    // Reload analytics to update storage freed
    final analytics = await _getAnalytics.call();
    storageFreed.value = analytics['storageFreed'] ?? 0;
  }
}
