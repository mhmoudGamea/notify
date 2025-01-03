import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:notify/core/utils/app_routes.dart';
import 'package:notify/core/utils/db_helper.dart';
import 'package:notify/core/utils/notification_services.dart';
import 'package:notify/core/utils/observer.dart';
import 'package:notify/core/utils/service_locator.dart';
import 'package:notify/features/notify/data/repos/my_notes_repo_impl.dart';
import 'package:notify/features/notify/presentation/model_views/notes/notes_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/notify/presentation/model_views/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  Bloc.observer = Observer();
  await NotificationServices.init(
      GetIt.I.get<FlutterLocalNotificationsPlugin>());
  await DBHelper.databaseInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ThemeCubit()
              ..toggleThemeMode(
                  GetIt.I.get<SharedPreferences>().getBool('darkMode'))),
        BlocProvider(create: (context) => NotesCubit(MyNotesRepoImpl())),
      ],
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.getRouter,
      debugShowCheckedModeBanner: false,
      title: 'notify',
      theme: context.read<ThemeCubit>().getLightMode(),
      darkTheme: context.read<ThemeCubit>().getDarkMode(),
      themeMode: context.watch<ThemeCubit>().getIsDark
          ? ThemeMode.dark
          : ThemeMode.light,
    );
  }
}
