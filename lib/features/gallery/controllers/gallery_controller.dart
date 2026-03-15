import 'package:get/get.dart';
import '../../../data/repositories/screenshot_repository.dart';
import '../../../domain/usecases/delete_screenshot.dart';
import '../../../domain/entities/screenshot_entity.dart';

class GalleryController extends GetxController {
  final ScreenshotRepository _repository;
  final DeleteScreenshot _deleteScreenshot;

  GalleryController(this._repository, this._deleteScreenshot);

  var isLoading = true.obs;
  var keptScreenshots = <ScreenshotEntity>[].obs;
  var selectedIds = <int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading.value = true;
    try {
      final data = await _repository.getKept();
      keptScreenshots.assignAll(data);
    } finally {
      isLoading.value = false;
    }
  }

  void toggleSelection(int id) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
  }

  Future<void> deleteSelected() async {
    final idsToDelete = selectedIds.toList();
    for (var id in idsToDelete) {
      await _deleteScreenshot.call(id);
    }
    selectedIds.clear();
    await loadData();
  }
}
