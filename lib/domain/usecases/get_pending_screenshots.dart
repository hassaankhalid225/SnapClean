import '../../data/repositories/screenshot_repository.dart';
import '../entities/screenshot_entity.dart';

class GetPendingScreenshots {
  final ScreenshotRepository repository;

  GetPendingScreenshots(this.repository);

  Future<List<ScreenshotEntity>> call() {
    return repository.getPending();
  }
}
