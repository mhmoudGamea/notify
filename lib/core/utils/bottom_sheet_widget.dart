import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/features/notify/data/models/my_notes_model.dart';

import '../../features/notify/presentation/model_views/notes/notes_cubit.dart';
import '../../features/notify/presentation/model_views/theme/theme_cubit.dart';
import '../custom/c_expanded_text_button.dart';
import 'app_theme.dart';

class BottomSheetWidget extends StatelessWidget {
  final MyNotesModel notesModel;
  const BottomSheetWidget({Key? key, required this.notesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noteData = BlocProvider.of<NotesCubit>(context);
    final theme = BlocProvider.of<ThemeCubit>(context).getIsDark;
    return Container(
      width: double.infinity,
      height: notesModel.isCompleted == 0
          ? MediaQuery.of(context).size.height * 0.34
          : MediaQuery.of(context).size.height * 0.25,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: theme ? const Color.fromARGB(255, 37, 36, 36) : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 4,
            width: 120,
            decoration: BoxDecoration(
              color: theme ? Colors.black : AppTheme.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Expanded(child: SizedBox()),
          if (notesModel.isCompleted == 0)
            CExpandedTextButton(
              text: 'Task completed',
              bgColor: AppTheme.darkBlue,
              onPress: () async {
                await noteData.updateNote(
                    noteId: notesModel.id, data: {'isCompleted': 1});
                await noteData.getNotes(date: notesModel.date);
                GoRouter.of(context).pop();
              },
            ),
          if (notesModel.isCompleted == 0) const SizedBox(height: 15),
          CExpandedTextButton(
            text: 'Delete Task',
            bgColor: Colors.red,
            textColor: Colors.white,
            onPress: () async {
              await noteData.deleteNote(noteId: notesModel.id);
              await noteData.getNotes(date: notesModel.date);
              GoRouter.of(context).pop();
            },
          ),
          const Expanded(child: SizedBox()),
          CExpandedTextButton(
            text: 'Close',
            bgColor: Colors.white,
            textColor: Colors.black,
            borderColor: Colors.black,
            onPress: () {
              GoRouter.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
