import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/features/profile/presentation/views/widgets/delayed_view_body.dart';

import '../../../../core/utils/helper.dart';
import '../../../../core/utils/styles.dart';
import '../../../notify/data/models/my_notes_model.dart';
import '../../../notify/presentation/model_views/theme/theme_cubit.dart';

class DelayedView extends StatelessWidget {
  static const String rn = '/delayedView';
  final List<MyNotesModel> delayedList;
  const DelayedView({Key? key, required this.delayedList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context).getIsDark;
    return Scaffold(
      appBar: Helper.getTCDAppBar(
        onTap: () {
          GoRouter.of(context).pop();
        },
        iconColor: theme ? Colors.white : Colors.black,
        title: 'Delayed notes',
        style: theme
            ? Styles.title16Dark
            : Styles.title16Light.copyWith(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
      ),
      body: SafeArea(
        child: DelayedViewBody(delayedList: delayedList),
      ),
    );
  }
}
