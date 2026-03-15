import '../../data/repositories/screenshot_repository.dart';

class GetAnalytics {
  final ScreenshotRepository repository;

  GetAnalytics(this.repository);

  Future<Map<String, dynamic>> call() {
    return repository.getAnalytics();
  }
}
