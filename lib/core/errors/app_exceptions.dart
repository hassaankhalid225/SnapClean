class AppException implements Exception {
  final String message;
  final String? prefix;
  final String? url;

  AppException(this.message, [this.prefix, this.url]);

  @override
  String toString() {
    return '${prefix ?? ''}$message';
  }
}

class StorageException extends AppException {
  StorageException(String message) : super(message, 'Storage Error: ');
}

class DatabaseException extends AppException {
  DatabaseException(String message) : super(message, 'Database Error: ');
}

class PermissionException extends AppException {
  PermissionException(String message) : super(message, 'Permission Error: ');
}
