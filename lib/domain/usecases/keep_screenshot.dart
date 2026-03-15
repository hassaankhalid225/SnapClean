import '../../data/repositories/screenshot_repository.dart';

class KeepScreenshot {
  final ScreenshotRepository repository;

  KeepScreenshot(this.repository);

  Future<void> call(int id) {
    return repository.markAsKept(id);
  }
}
