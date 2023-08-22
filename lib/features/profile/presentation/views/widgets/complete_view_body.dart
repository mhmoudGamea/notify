import 'package:flutter/material.dart';
import 'package:notify/core/utils/app_images.dart';
import 'package:notify/features/notify/data/models/my_notes_model.dart';

import '../../../../notify/presentation/views/widgets/no_notes.dart';
import 'tcd_item.dart';

class CompleteViewBody extends StatelessWidget {
  final List<MyNotesModel> completeList;
  const CompleteViewBody({Key? key, required this.completeList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return completeList.isEmpty
        ? const NoNotes(message: 'No COMPLETE notes for now')
        : ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemCount: completeList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) => TcdItem(
                note: completeList[index], image: Assets.imagesCompleted),
          );
  }
}
