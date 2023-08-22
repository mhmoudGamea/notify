import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notify/core/utils/app_images.dart';
import 'package:notify/core/utils/app_theme.dart';
import 'package:notify/features/notify/presentation/views/widgets/no_notes.dart';
import 'package:notify/features/profile/presentation/views/complete_view.dart';
import 'package:notify/features/profile/presentation/views/delayed_view.dart';
import 'package:notify/features/profile/presentation/views/todo_view.dart';
import 'package:notify/features/profile/presentation/views/widgets/note_box.dart';
import 'package:notify/features/profile/presentation/views/widgets/notes_number_box.dart';

import '../../../../notify/presentation/model_views/theme/theme_cubit.dart';
import '../../model_views/profile/profile_cubit.dart';
import 'note_item_box.dart';
import 'search_box.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileData = BlocProvider.of<ProfileCubit>(context);
    final theme = context.watch<ThemeCubit>().getIsDark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NotesNumberBox(
              theme: theme, notesNumber: profileData.getNotes.length),
          const SizedBox(height: 20),
          SearchBox(controller: profileData.getSearchController),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(TodoView.rn, extra: profileData.getTodoList);
                },
                child: NoteBox(
                    image: Assets.imagesTodo,
                    borderColor: AppTheme.todoBorder,
                    text: '${profileData.getTodoList.length} TODO'),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(CompleteView.rn,
                      extra: profileData.getCompletedList);
                },
                child: NoteBox(
                    image: Assets.imagesCompleted,
                    borderColor: AppTheme.completedBorder,
                    text: '${profileData.getCompletedList.length} COMPLETED'),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(DelayedView.rn, extra: profileData.getDelayedList);
                },
                child: NoteBox(
                    image: Assets.imagesDelayed,
                    borderColor: AppTheme.delayedBorder,
                    text: '${profileData.getDelayedList.length} DELAYED'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Today\'s tasks',
            style: GoogleFonts.nunito(
                fontSize: 23,
                fontWeight: FontWeight.w800,
                color: theme ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 15),
          profileData.getTodaysList.isEmpty
              ? const NoNotes(
                  message:
                      'No notes added yet. please add your first note for this day')
              : SizedBox(
                  height: 165,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: profileData.getTodaysList.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemBuilder: (context, index) => NoteItemBox(
                        noteModel: profileData.getTodaysList[index],
                        theme: theme),
                  ),
                ),
        ],
      ),
    );
  }
}
