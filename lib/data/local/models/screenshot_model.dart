import 'package:drift/drift.dart';

@DataClassName('ScreenshotModel')
class Screenshots extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get filePath => text()();
  TextColumn get fileName => text()();
  IntColumn get fileSize => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get detectedAt => dateTime()();
  TextColumn get status => text().withLength(min: 1, max: 20)(); // pending, kept, deleted
  BoolColumn get isImportant => boolean().withDefault(const Constant(false))();
  TextColumn get category => text().withDefault(const Constant('unknown'))();
}
