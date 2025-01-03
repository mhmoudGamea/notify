import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/core/utils/notification_services.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_theme.dart';
import '../../../../core/utils/helper.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../model_views/theme/theme_cubit.dart';
import 'widgets/notify_view_body.dart';

class NotifyView extends StatelessWidget {
  static const String rn = '/';
  const NotifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mode = context.watch<ThemeCubit>().getIsDark;
    return Scaffold(
      appBar: Helper.getAppBar(
          onTap: () {
            _changeTheme(context);
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

_changeTheme(BuildContext context) {
  final themeCubit = BlocProvider.of<ThemeCubit>(context);
  themeCubit.toggleThemeMode();

  log(themeCubit.getIsDark.toString());

  NotificationServices.showBasicNotification(
    notifTitle: 'Theme Changed',
    notifBody:
        themeCubit.getIsDark ? 'Dark theme activated' : 'Light theme activated',
  );
}
