import 'package:flutter/material.dart';
import 'package:notify/features/notify/data/models/my_notes_model.dart';

import '../../../../../core/utils/styles.dart';

class NoteItemBox extends StatelessWidget {
  final MyNotesModel noteModel;
  final bool theme;
  const NoteItemBox({Key? key, required this.noteModel, required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(noteModel.color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // title , start & end time and note
          Text(noteModel.title,
              style: Styles.title16Dark
                  .copyWith(fontWeight: FontWeight.w800, color: Colors.black)),
          const SizedBox(height: 5),
          Text(
            noteModel.note,
            style: Styles.title15Light.copyWith(color: Colors.grey[800]),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
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
                "${noteModel.startTime} - ${noteModel.endTime}",
                style: Styles.title14Dark
                    .copyWith(fontSize: 13, color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 5),
          //status of note [done, progress, todo]
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Colors.grey[800],
                size: 17,
              ),
              const SizedBox(width: 4),
              Text(
                noteModel.date,
                style: Styles.title14Light
                    .copyWith(fontSize: 13, color: Colors.grey[600]),
              ),
              const Spacer(),
              Text(
                noteModel.isCompleted == 0 ? 'TODO' : 'COMPLETED',
                style: Styles.title14Dark.copyWith(
                    fontWeight: FontWeight.w600, color: Colors.grey[800]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
