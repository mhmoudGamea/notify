import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/core/utils/helper.dart';
import 'package:notify/features/notify/presentation/views/widgets/notify_view_body.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_theme.dart';
import '../../../../core/utils/notification_services.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../model_views/theme/theme_cubit.dart';

class NotifyView extends StatelessWidget {
  static const String rn = '/';
  const NotifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mode = context.watch<ThemeCubit>().getIsDark;
    return Scaffold(
      appBar: Helper.getAppBar(
          onTap: () {
            // print(mode);
            _changeTheme(context, mode);
          },
          router: () {
            GoRouter.of(context).push(ProfileView.rn);
          },
          icon: mode ? Icons.wb_sunny_outlined : Icons.nightlight_outlined,
          iconColor: mode ? Colors.white : AppTheme.primaryDark,
          image: Assets.imagesNote),
      body: const SafeArea(
        child: NotifyViewBody(),
      ),
    );
  }
}

_changeTheme(BuildContext context, bool theme) {
  context.read<ThemeCubit>().toggleThemeMode();
  NotificationServices.showNotification(
    title: 'Theme Changed',
    body: theme ? 'Light theme activated' : 'Dark theme activated',
    flnp: GetIt.I.get<FlutterLocalNotificationsPlugin>(),
  );
}
