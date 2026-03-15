import 'dart:io';
import 'package:drift/drift.dart';
import '../../domain/entities/screenshot_entity.dart';
import '../local/database/app_database.dart';
import '../local/database/screenshot_dao.dart';
import '../local/models/screenshot_model.dart';
import 'package:get/get.dart';

class ScreenshotRepository {
  final ScreenshotDao _dao;

  ScreenshotRepository(this._dao);

  ScreenshotEntity _mapToEntity(ScreenshotModel model) {
    return ScreenshotEntity(
      id: model.id,
      filePath: model.filePath,
      fileName: model.fileName,
      fileSize: model.fileSize,
      createdAt: model.createdAt,
      detectedAt: model.detectedAt,
      status: model.status,
      isImportant: model.isImportant,
      category: model.category,
    );
  }

  Future<List<ScreenshotEntity>> getPending() async {
    final models = await _dao.getAllPending();
    return models.map(_mapToEntity).toList();
  }

  Future<List<ScreenshotEntity>> getKept() async {
    final models = await _dao.getAllKept();
    return models.map(_mapToEntity).toList();
  }

  Future<void> markAsKept(int id) async {
    // We need to fetch it first, or write a custom query in dao
    // Better to fetch and update
    final all = await _dao.getAllPending();
    final model = all.firstWhereOrNull((s) => s.id == id);
    if (model != null) {
      await _dao.updateScreenshot(model.copyWith(status: 'kept'));
    }
  }

  Future<void> markAsDeleted(int id) async {
    final all = await _dao.getAllPending();
    final model = all.firstWhereOrNull((s) => s.id == id);
    if (model != null) {
      // Actually delete from file system
      final file = File(model.filePath);
      if (await file.exists()) {
        await file.delete();
      }
      await _dao.updateScreenshot(model.copyWith(status: 'deleted'));
    }
  }

  Future<void> markAsImportant(int id, bool important) async {
    final all = await _dao.getAllKept();
    final model = all.firstWhereOrNull((s) => s.id == id);
    if (model != null) {
      await _dao.updateScreenshot(model.copyWith(isImportant: important));
    }
  }

  Future<Map<String, dynamic>> getAnalytics() async {
    final allKept = await _dao.getAllKept();
    final allDeleted = await _dao.getAllDeleted();
    
    // Calculate storage freed
    int storageFreed = 0;
    for (var m in allDeleted) {
      storageFreed += m.fileSize;
    }

    return {
      'totalTaken': allKept.length + allDeleted.length,
      'totalDeleted': allDeleted.length,
      'storageFreed': storageFreed,
    };
  }

  Future<void> addPendingScreenshot(String path, String name, int size, DateTime createdAt) async {
    final existing = await _dao.getByFilePath(path);
    if (existing == null) {
      await _dao.insertScreenshot(ScreenshotsCompanion.insert(
        filePath: path,
        fileName: name,
        fileSize: size,
        createdAt: createdAt,
        detectedAt: DateTime.now(),
        status: 'pending',
      ));
    }
  }
}
