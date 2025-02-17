import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/core/utils/app_theme.dart';
import 'package:notify/features/notify/presentation/model_views/notes/notes_cubit.dart';
import 'package:notify/features/notify/presentation/views/widgets/notes_list.dart';

import 'no_notes.dart';

class NotesSection extends StatelessWidget {
  const NotesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state is NotesSuccess) {
            if (state.myNotesList.isEmpty) {
              return const NoNotes(message: '''
What do you want to do today?
press Add Task button to add your tasks.
''');
            }
            return NotesList(notesList: state.myNotesList);
          } else if (state is NotesFailure) {
            return const Center(
              child: Text('eroooooooooooooooooooooor'),
            );
          }
          // in case state is NotesLoading
          return const Center(
            child: CircularProgressIndicator(
              color: AppTheme.darkBlue,
              backgroundColor: AppTheme.lightBlue,
            ),
          );
        },
      ),
    );
  }
}
