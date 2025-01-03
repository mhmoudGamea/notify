import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:notify/core/utils/helper.dart';
import 'package:notify/features/notify/data/models/my_notes_model.dart';
import 'package:notify/features/notify/presentation/views/widgets/note_item.dart';

class NotesList extends StatelessWidget {
  final List<MyNotesModel> notesList;
  const NotesList({Key? key, required this.notesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      itemCount: notesList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemBuilder: (context, index) {
        final DateTime noteTime =
            DateFormat.Hm().parse(notesList[index].startTime);
        final String time = DateFormat('HH:MM').format(noteTime);
        log(noteTime.toString());
        log(time);
        // NotificationServices.scheduleNotification(
        //   flnp: FlutterLocalNotificationsPlugin(),
        //   hour: int.parse(time.split(':')[0]),
        //   minute: int.parse(time.split(':')[1]),
        //   myNotesModel: notesList[index],
        // );
        return AnimationConfiguration.staggeredList(
          position: index,
          child: SlideAnimation(
            horizontalOffset: 50.0,
            delay: const Duration(microseconds: 2000),
            curve: Curves.easeInOut,
            child: FadeInAnimation(
              child: GestureDetector(
                onTap: () {
                  Helper.mySheet(
                      context: context, notesModel: notesList[index]);
                },
                child: NoteItem(notesModel: notesList[index]),
              ),
            ),
          ),
        );
      },
    );
  }
}
