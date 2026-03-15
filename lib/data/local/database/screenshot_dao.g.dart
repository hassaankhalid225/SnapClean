// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screenshot_dao.dart';

// ignore_for_file: type=lint
mixin _$ScreenshotDaoMixin on DatabaseAccessor<AppDatabase> {
  $ScreenshotsTable get screenshots => attachedDatabase.screenshots;
  ScreenshotDaoManager get managers => ScreenshotDaoManager(this);
}

class ScreenshotDaoManager {
  final _$ScreenshotDaoMixin _db;
  ScreenshotDaoManager(this._db);
  $$ScreenshotsTableTableManager get screenshots =>
      $$ScreenshotsTableTableManager(_db.attachedDatabase, _db.screenshots);
}
