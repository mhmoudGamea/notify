import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/core/utils/app_images.dart';
import 'package:notify/core/utils/helper.dart';
import 'package:notify/features/new_note/data/repos/note_repo_impl.dart';
import 'package:notify/features/notify/presentation/model_views/theme/theme_cubit.dart';
import 'package:notify/features/profile/presentation/views/profile_view.dart';

import '../../../../core/utils/app_theme.dart';
import '../model_views/form/form_cubit.dart';
import 'widgets/add_note_view_body.dart';

class AddNoteView extends StatelessWidget {
  static const String rn = '/addTaskView';
  const AddNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormCubit(NoteRepoImpl()),
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
        body: const SafeArea(
          child: AddNoteViewBody(),
        ),
      ),
    );
  }
}
