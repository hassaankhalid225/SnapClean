import 'package:get/get.dart';
import '../../../domain/usecases/get_analytics.dart';

class AnalyticsController extends GetxController {
  final GetAnalytics _getAnalytics;

  AnalyticsController(this._getAnalytics);

  var isLoading = true.obs;
  var totalTaken = 0.obs;
  var totalDeleted = 0.obs;
  var storageFreed = 0.obs;

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
      totalDeleted.value = analytics['totalDeleted'] ?? 0;
      storageFreed.value = analytics['storageFreed'] ?? 0;
    } finally {
      isLoading.value = false;
    }
  }
}
