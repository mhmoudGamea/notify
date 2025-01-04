import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/core/custom/c_text_button.dart';
import 'package:notify/features/new_note/presentation/views/widgets/color_section.dart';
import 'package:notify/features/new_note/presentation/views/widgets/label_text.dart';
import 'package:notify/features/new_note/presentation/views/widgets/time_section.dart';

import '../../model_views/form/form_cubit.dart';
import 'date_section.dart';
import 'input_field.dart';

class AddNoteViewBody extends StatelessWidget {
  const AddNoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formData = BlocProvider.of<FormCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LabelText(title: 'Title'),
                  InputField(
                    hint: 'Enter title here.',
                    controller: formData.getTitleController,
                  ),
                  const SizedBox(height: 10),
                  const LabelText(title: 'Note'),
                  InputField(
                    hint: 'Enter note here.',
                    controller: formData.getNoteController,
                  ),
                  const SizedBox(height: 10),
                  const LabelText(title: 'Date'),
                  const DateSection(),
                  const SizedBox(height: 10),
                  const TimeSection(),
                  const SizedBox(height: 10),
                  const ColorSection(),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CTextButton(
                  text: 'Add Note',
                  onPress: () {
                    formData.validate(context);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
