import 'package:flutter/material.dart';
import 'package:notify/core/utils/app_images.dart';

import '../../../../notify/data/models/my_notes_model.dart';
import '../../../../notify/presentation/views/widgets/no_notes.dart';
import 'tcd_item.dart';

class DelayedViewBody extends StatelessWidget {
  final List<MyNotesModel> delayedList;
  const DelayedViewBody({Key? key, required this.delayedList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return delayedList.isEmpty
        ? const NoNotes(message: 'No COMPLETE notes for now')
        : ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemCount: delayedList.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) =>
                TcdItem(note: delayedList[index], image: Assets.imagesDelayed),
          );
  }
}
