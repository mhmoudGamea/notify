import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/helper.dart';
import '../../model_views/form/form_cubit.dart';
import 'input_field.dart';

class DateSection extends StatelessWidget {
  const DateSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formDate = BlocProvider.of<FormCubit>(context);
    return InputField(
      // note that you can use blocBuilder here instead of context.watch()
      hint: DateFormat.yMd().format(context.watch<FormCubit>().getCurrentDate),
      // readOnly: true,
      // enableIcon: true,
      icon: Icons.date_range_rounded,
      onPress: () async {
        DateTime? noteDate = await Helper.getDatePicker(context);
        if (noteDate != null) {
          formDate.setCurrentDate = noteDate;
        }
      },
    );
  }
}
