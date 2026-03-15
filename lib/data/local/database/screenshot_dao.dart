import 'package:drift/drift.dart';
import 'app_database.dart';
import '../models/screenshot_model.dart';

part 'screenshot_dao.g.dart';

@DriftAccessor(tables: [Screenshots])
class ScreenshotDao extends DatabaseAccessor<AppDatabase> with _$ScreenshotDaoMixin {
  final AppDatabase db;
  
  ScreenshotDao(this.db) : super(db);
  
  Future<List<ScreenshotModel>> getAllPending() => 
      (select(screenshots)..where((s) => s.status.equals('pending'))).get();
      
  Future<List<ScreenshotModel>> getAllKept() => 
      (select(screenshots)..where((s) => s.status.equals('kept'))).get();
      
  Future<List<ScreenshotModel>> getAllDeleted() => 
      (select(screenshots)..where((s) => s.status.equals('deleted'))).get();
      
  Future<int> insertScreenshot(ScreenshotsCompanion companion) => 
      into(screenshots).insert(companion);
      
  Future<bool> updateScreenshot(ScreenshotModel model) => 
      update(screenshots).replace(model);
      
  Future<ScreenshotModel?> getByFilePath(String path) =>
      (select(screenshots)..where((s) => s.filePath.equals(path))).getSingleOrNull();
      
  Future<int> deleteScreenshot(int id) =>
      (delete(screenshots)..where((s) => s.id.equals(id))).go();
}
