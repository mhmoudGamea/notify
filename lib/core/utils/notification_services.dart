import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

import '../config/constants.dart';

abstract class NotificationServices {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin =
      GetIt.I.get<FlutterLocalNotificationsPlugin>();

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
    SharedPreferences prefs = GetIt.I.get<SharedPreferences>();
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
      importance: Importance.max,
      priority: Priority.high,
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

  /// method used to show very repeated local notification [everyMinute, hourly, daily]
  static Future<void> showRepeatedNotification({
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

  static Future<tz.TZDateTime> getScheduleDate({
    required DateTime currentTaskData,
    required TimeOfDay startTaskTime,
  }) async {
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    final currentLocation = tz.getLocation(currentTimeZone);
    tz.setLocalLocation(currentLocation);

    final tz.TZDateTime dailyScheduledNotification = tz.TZDateTime(
      tz.local,
      currentTaskData.year,
      currentTaskData.month,
      currentTaskData.day,
      startTaskTime.hour,
      startTaskTime.minute,
    ).subtract(const Duration(minutes: 1));
    return dailyScheduledNotification;
  }

  /// method used to show schedule local notification
  static Future<void> showScheduleNotification({
    required String notifTitle,
    required String notifBody,
    required DateTime currentTaskData,
    required TimeOfDay startTaskTime,
  }) async {
    var notificationId = await getCounter();

    NotificationDetails notificationDetails = getNotificationDetails(
        channelId: '2', channelName: 'schedule notification');

    _flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      notifTitle,
      notifBody,
      await getScheduleDate(
          currentTaskData: currentTaskData, startTaskTime: startTaskTime),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      // androidScheduleMode: AndroidScheduleMode.exact,
    );
  }

  static Future<tz.TZDateTime> getDailyScheduleDate() async {
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    final tz.Location currentLocation = tz.getLocation(currentTimeZone);
    tz.setLocalLocation(currentLocation);

    final tz.TZDateTime now = tz.TZDateTime.now(currentLocation);

    final tz.TZDateTime dailyScheduledNotification = tz.TZDateTime(
      currentLocation,
      now.year,
      now.month,
      now.day,
      8,
      0,
      0,
    );
    return dailyScheduledNotification.isBefore(now)
        ? dailyScheduledNotification.add(const Duration(days: 1))
        : dailyScheduledNotification;
  }

  /// method used to remind the user every day at 8:00 AM to add his tasks
  /// so it is a compination between periodically and schedule notif so you can say
  static Future<void> showDailyScheduledNotification({
    required String notifTitle,
    required String notifBody,
  }) async {
    var notificationId = await getCounter();

    NotificationDetails notificationDetails = getNotificationDetails(
        channelId: '3', channelName: '8:00 AM repeated schedule notification');

    _flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      notifTitle,
      notifBody,
      await getDailyScheduleDate(),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }
}
