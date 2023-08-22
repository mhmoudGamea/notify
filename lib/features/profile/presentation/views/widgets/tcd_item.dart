import 'package:flutter/material.dart';
import 'package:notify/features/notify/data/models/my_notes_model.dart';

import '../../../../../core/utils/styles.dart';

class TcdItem extends StatelessWidget {
  final MyNotesModel note;
  final String image;
  const TcdItem({Key? key, required this.note, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 246, 250, 255),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title , start & end time and note

          Text(note.title,
              style: Styles.title16Dark.copyWith(
                  fontWeight: FontWeight.w800, color: Color(note.color))),

          const SizedBox(height: 5),
          Text(
            note.note,
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
                "${note.startTime} - ${note.endTime}",
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
                note.date,
                style: Styles.title14Light
                    .copyWith(fontSize: 13, color: Colors.grey[600]),
              ),
              const Spacer(),
              Image.asset(image, width: 23),
              const SizedBox(width: 4),
              Text(
                note.isCompleted == 0 ? 'TODO' : 'COMPLETED',
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
