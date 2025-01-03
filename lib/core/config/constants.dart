enum Message {
  success,
  error,
}

abstract class Constants {
  static const double borderRadius = 6.0;
  static const double padding = 16.0;
  static const String tableName = 'places';

  // counter constant of notification id
  static const String kNotificationCounter = 'notification_counter';

  // key for dark and light mode
  static const String kIsDarkMode = 'is_dark_mode';
}
