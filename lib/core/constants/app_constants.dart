class AppConstants {
  static const String appName = 'SnapClean';
  static const String appTagline = 'Screenshots, sorted.';
  
  static const String dbName = 'snapclean_db.sqlite';
  static const String screenshotsFolder = 'Screenshots';
  
  static const String isFirstLaunchKey = 'is_first_launch';
  static const String autoDeleteEnabledKey = 'auto_delete_enabled';
  static const String autoDeleteDelayKey = 'auto_delete_delay';
  static const String notificationsEnabledKey = 'notifications_enabled';
  
  static const String backgroundTaskName = 'checkNewScreenshots';
  static const int screenshotCheckIntervalMins = 15;
}
