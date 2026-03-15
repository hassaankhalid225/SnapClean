import 'package:get/get.dart';
import '../../data/local/database/app_database.dart';
import '../../data/local/database/screenshot_dao.dart';
import '../../data/repositories/screenshot_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    final db = AppDatabase();
    Get.put(db, permanent: true);
    final dao = ScreenshotDao(db);
    Get.put(dao, permanent: true);
    Get.put(ScreenshotRepository(dao), permanent: true);
  }
}
