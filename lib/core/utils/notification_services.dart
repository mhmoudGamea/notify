import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

import '../config/constants.dart';

abstract class NotificationServices {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin =
      GetIt.instance<FlutterLocalNotificationsPlugin>();

  /// when user tap on notification when app is running [Foreground]
  static Future<void> onForegroundTap(
      NotificationResponse notificationResponse) async {}

  /// when user tap on notification when app is in background [Background]
  static Future<void> onBackgroundTap(
      NotificationResponse notificationResponse) async {}

  /// initializing [FlutterLocalNotificationsPlugin] it 'll be called in main
  static Future<void> init() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onForegroundTap,
      onDidReceiveBackgroundNotificationResponse: onBackgroundTap,
    );
  }

  /// getCounter method to give each notification a unique [NotificationId]
  /// so first notif id = [1], second notif id = [2] and so on...
  static Future<int> getCounter() async {
    SharedPreferences prefs = GetIt.instance<SharedPreferences>();
    var counter = (prefs.getInt(Constants.kNotificationCounter) ?? 0) + 1;
    await prefs.setInt(Constants.kNotificationCounter, counter);
    return counter;
  }

  /// method to get [NotificationDetails] for all types of notif
  /// it preserve DRY principle and make code clean
  static NotificationDetails getNotificationDetails(
      {required String channelId, required String channelName}) {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      channelId,
      channelName,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    return notificationDetails;
  }

  /// method used to show very basic local notification
  static Future<void> showBasicNotification(
      {required String notifTitle, required String notifBody}) async {
    var notificationId = await getCounter();

    NotificationDetails notificationDetails = getNotificationDetails(
        channelId: '0', channelName: 'basic notification');

    _flutterLocalNotificationsPlugin.show(
      notificationId,
      notifTitle,
      notifBody,
      notificationDetails,
    );
  }

  /// method used to show very basic local notification
  static Future<void> showPeriodicNotification({
    required String notifTitle,
    required String notifBody,
    required RepeatInterval repeatInterval,
  }) async {
    var notificationId = await getCounter();

    NotificationDetails notificationDetails = getNotificationDetails(
        channelId: '1', channelName: 'periodic notification');

    _flutterLocalNotificationsPlugin.periodicallyShow(
      notificationId,
      notifTitle,
      notifBody,
      repeatInterval,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  static Future<tz.TZDateTime> getScheduleDate() async {
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    final currentLocation = tz.getLocation(currentTimeZone);
    tz.setLocalLocation(currentLocation);

    final tz.TZDateTime now = tz.TZDateTime.now(currentLocation);
    final tz.TZDateTime next = now.add(const Duration(seconds: 10));
    return next;
  }

  /// method used to show schedule local notification
  static Future<void> showScheduleNotification({
    required String notifTitle,
    required String notifBody,
  }) async {
    var notificationId = await getCounter();

    NotificationDetails notificationDetails = getNotificationDetails(
        channelId: '2', channelName: 'schedule notification');

    _flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      notifTitle,
      notifBody,
      await getScheduleDate(),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }
}
