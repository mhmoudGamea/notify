import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/core/utils/styles.dart';
import 'package:notify/features/notify/presentation/model_views/theme/theme_cubit.dart';

class LabelText extends StatelessWidget {
  final String title;
  const LabelText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.watch<ThemeCubit>().getIsDark
          ? Styles.title14Dark
          : Styles.title14Light
              .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
    );
  }
}
