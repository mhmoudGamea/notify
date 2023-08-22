import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:notify/features/new_note/data/repos/note_repo_impl.dart';
import 'package:notify/features/new_note/presentation/model_views/form/form_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/notify/presentation/model_views/theme/theme_cubit.dart';

abstract class ServiceLocator {
  static final GetIt _getIt = GetIt.I;

  static Future<void> init() async {
    _getIt.registerSingleton<SharedPreferences>(
        await SharedPreferences.getInstance());
    _getIt.registerSingleton<FlutterLocalNotificationsPlugin>(
        FlutterLocalNotificationsPlugin());
    _getIt.registerSingleton<ThemeCubit>(ThemeCubit());
    _getIt.registerSingleton<FormCubit>(FormCubit(NoteRepoImpl()));
  }
}
