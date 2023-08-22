import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/features/profile/data/repos/profile_repo_impl.dart';
import 'package:notify/features/profile/presentation/model_views/profile/profile_cubit.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_theme.dart';
import '../../../../core/utils/helper.dart';
import '../../../notify/presentation/model_views/theme/theme_cubit.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  static const String rn = '/profileView';
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(ProfileRepoImpl())..getAllNotes(context),
      child: Scaffold(
        appBar: Helper.getAppBar(
          onTap: () {
            GoRouter.of(context).pop();
          },
          router: () {
            GoRouter.of(context).push(ProfileView.rn);
          },
          icon: Icons.arrow_back_ios_rounded,
          iconColor: context.watch<ThemeCubit>().getIsDark
              ? Colors.white
              : AppTheme.primaryDark,
          iconSize: 22,
          image: Assets.imagesNote,
        ),
        body: const SafeArea(child: ProfileViewBody()),
      ),
    );
  }
}
