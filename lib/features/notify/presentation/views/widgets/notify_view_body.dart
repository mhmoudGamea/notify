import 'package:flutter/material.dart';
import 'package:notify/features/notify/presentation/views/widgets/add_task_section.dart';
import 'package:notify/features/notify/presentation/views/widgets/date_section.dart';

import 'notes_section.dart';

class NotifyViewBody extends StatelessWidget {
  const NotifyViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 8),
        AddTaskSection(),
        SizedBox(height: 8),
        DateSection(),
        SizedBox(height: 8),
        NotesSection(),
      ],
    );
  }
}
