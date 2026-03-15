class ScreenshotEntity {
  final int id;
  final String filePath;
  final String fileName;
  final int fileSize;
  final DateTime createdAt;
  final DateTime detectedAt;
  final String status; // 'pending', 'kept', 'deleted'
  final bool isImportant;
  final String category;

  ScreenshotEntity({
    required this.id,
    required this.filePath,
    required this.fileName,
    required this.fileSize,
    required this.createdAt,
    required this.detectedAt,
    required this.status,
    required this.isImportant,
    required this.category,
  });
}
