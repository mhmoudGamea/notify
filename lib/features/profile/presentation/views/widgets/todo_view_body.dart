import 'package:flutter/material.dart';
import 'package:notify/core/utils/app_images.dart';
import 'package:notify/features/notify/presentation/views/widgets/no_notes.dart';

import '../../../../notify/data/models/my_notes_model.dart';
import 'tcd_item.dart';

class TodoViewBody extends StatelessWidget {
  final List<MyNotesModel> todoList;
  const TodoViewBody({Key? key, required this.todoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return todoList.isEmpty
        ? const NoNotes(message: 'No TODO notes for now')
        : ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemCount: todoList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) =>
                TcdItem(note: todoList[index], image: Assets.imagesTodo),
          );
  }
}
