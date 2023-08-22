import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:notify/core/custom/c_text_button.dart';
import 'package:notify/core/utils/styles.dart';
import 'package:notify/features/notify/presentation/model_views/theme/theme_cubit.dart';
import 'package:notify/features/new_note/presentation/views/add_note_view.dart';

class AddTaskSection extends StatelessWidget {
  const AddTaskSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat.yMMMMd().format(DateTime.now()),
            style: context.watch<ThemeCubit>().getIsDark
                ? Styles.title14Dark.copyWith(color: Colors.grey[400])
                : Styles.title14Light,
          ),
          CTextButton(
              text: 'Add Task',
              onPress: () {
                GoRouter.of(context).push(AddNoteView.rn);
              })
        ],
      ),
    );
  }
}
