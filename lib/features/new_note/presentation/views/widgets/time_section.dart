import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notify/core/utils/helper.dart';
import 'package:notify/features/new_note/presentation/model_views/form/form_cubit.dart';

import 'input_field.dart';
import 'label_text.dart';

class TimeSection extends StatelessWidget {
  const TimeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formData = context.watch<FormCubit>();
    final data = BlocProvider.of<FormCubit>(context, listen: false);
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelText(title: 'Start time'),
              InputField(
                hint: formData.getStartTime.format(context),
                // readOnly: false,
                // enableIcon: true,
                icon: Icons.access_time_rounded,
                onPress: () async {
                  TimeOfDay? noteStartTime =
                      await Helper.getTimePicker(context, data.getStartTime);
                  if (noteStartTime != null) {
                    data.setStartTime = noteStartTime;
                  }
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelText(title: 'End time'),
              InputField(
                //format return string like => 9: 30 AM
                hint: formData.getEndTime.format(context),
                // readOnly: true,
                // enableIcon: true,
                icon: Icons.access_time_rounded,
                onPress: () async {
                  TimeOfDay? noteEndTime =
                      await Helper.getTimePicker(context, data.getEndTime);
                  if (noteEndTime != null) {
                    data.setEndTime = noteEndTime;
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
