import 'package:flutter/material.dart';
import 'package:notify/core/utils/app_theme.dart';
import 'package:notify/core/utils/styles.dart';
import 'package:notify/features/notify/data/models/my_notes_model.dart';

class NoteItem extends StatelessWidget {
  final MyNotesModel notesModel;
  const NoteItem({Key? key, required this.notesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(notesModel.color),
      ),
      child: Row(
        children: [
          // title , start & end time and note
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notesModel.title,
                    style: Styles.title16Dark.copyWith(
                        fontWeight: FontWeight.w800, color: Colors.black)),
                const SizedBox(height: 5),
                Text(
                  notesModel.note,
                  style: Styles.title15Dark.copyWith(color: Colors.grey[800]),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey[800],
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${notesModel.startTime} - ${notesModel.endTime}",
                      style: Styles.title14Dark
                          .copyWith(fontSize: 13, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // divider
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            color: AppTheme.lightBlue,
            width: 1.5,
            height: 100,
          ),
          //status of note [done, progress, todo]
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              notesModel.isCompleted == 0 ? 'TODO' : 'COMPLETED',
              style: Styles.title14Dark.copyWith(
                  fontWeight: FontWeight.w700, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}
