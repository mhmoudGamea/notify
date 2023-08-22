import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/core/utils/helper.dart';
import 'package:notify/core/utils/styles.dart';
import 'package:notify/features/notify/presentation/model_views/theme/theme_cubit.dart';
import 'package:notify/features/profile/presentation/views/widgets/todo_view_body.dart';

import '../../../notify/data/models/my_notes_model.dart';

class TodoView extends StatelessWidget {
  static const String rn = '/todoView';
  final List<MyNotesModel> todoList;
  const TodoView({Key? key, required this.todoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BlocProvider.of<ThemeCubit>(context).getIsDark;
    return Scaffold(
      appBar: Helper.getTCDAppBar(
        onTap: () {
          GoRouter.of(context).pop();
        },
        iconColor: theme ? Colors.white : Colors.black,
        title: 'Todo notes',
        style: theme
            ? Styles.title16Dark
            : Styles.title16Light.copyWith(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
      ),
      body: SafeArea(
        child: TodoViewBody(todoList: todoList),
      ),
    );
  }
}
