import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/core/utils/app_theme.dart';
import 'package:notify/core/utils/styles.dart';
import 'package:notify/features/profile/presentation/model_views/profile/profile_cubit.dart';

import 'profile_body.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is NotesSuccess) {
          return const ProfileBody();
        } else if (state is NotesFailure) {
          return Center(
            child: Text('Unexpected error happen.', style: Styles.title15Light),
          );
        }
        return const Center(
            child: CircularProgressIndicator(
          color: AppTheme.darkBlue,
          backgroundColor: AppTheme.lightBlue,
        ));
      },
    );
  }
}
