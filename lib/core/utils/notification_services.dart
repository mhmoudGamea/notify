import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../../features/notify/data/models/my_notes_model.dart';

abstract class NotificationServices {
  static Future<void> init(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    confiqureTimeZone();
    const androidInitialize =
        AndroidInitializationSettings('mipmap/ic_launcher');
    const initializationSettings =
        InitializationSettings(android: androidInitialize);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }

  static Future<void> showNotification({
    var id = 0,
    required String title,
    required String body,
    required FlutterLocalNotificationsPlugin flnp,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'you_can_name_it_whatever',
      'channelName',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('notification'),
    );

    var notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flnp.show(id, title, body, notificationDetails);
  }

  static Future<void> scheduleNotification(
      {required FlutterLocalNotificationsPlugin flnp,
      required int hour,
      required int minute,
      required MyNotesModel myNotesModel}) async {
    flnp.zonedSchedule(
      0,
      'title',
      'body',
      convertDateTime(hour: hour, minute: minute),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'you_can_name_it_whatever',
          'channelName',
          importance: Importance.max,
          priority: Priority.high,
          sound: RawResourceAndroidNotificationSound('notification'),
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static tz.TZDateTime convertDateTime(
      {required int hour, required int minute}) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledTime =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduledTime.isBefore(now)) {
      // now > scheduledTime
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }
    return scheduledTime;
  }

  static void confiqureTimeZone() {
    tz.initializeTimeZones();
    String timeZone = tz.timeZoneDatabase.locations.keys.first;
    print(timeZone);
    tz.setLocalLocation(tz.getLocation(timeZone));
  }
}
