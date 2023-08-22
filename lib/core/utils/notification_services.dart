import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class NotificationServices {
  static Future<void> init(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
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
}
