import '../../data/repositories/screenshot_repository.dart';

class DeleteScreenshot {
  final ScreenshotRepository repository;

  DeleteScreenshot(this.repository);

  Future<void> call(int id) {
    return repository.markAsDeleted(id);
  }
}
