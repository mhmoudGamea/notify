import 'package:workmanager/workmanager.dart';

import 'notification_services.dart';

abstract class WorkManagerService {
  static Future<void> register() async {
    await Workmanager().registerPeriodicTask(
      'id',
      'background task',
      frequency: const Duration(seconds: 15),
    );
  }

  static Future<void> init() async {
    await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
    await register();
  }
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((v, m) {
    NotificationServices.showDailyScheduledNotification(
        notifTitle: 'Notify Missing You',
        notifBody: 'Don\'t forget to add your daily tasks.');
    return Future.value(true);
  });
}
