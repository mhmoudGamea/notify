import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notify/core/utils/app_theme.dart';
import 'package:notify/core/utils/styles.dart';
import 'package:notify/features/notify/presentation/model_views/notes/notes_cubit.dart';
import 'package:notify/features/notify/presentation/model_views/theme/theme_cubit.dart';

class DateSection extends StatelessWidget {
  const DateSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 50,
        selectionColor: AppTheme.darkBlue,
        selectedTextColor: Colors.white,
        initialSelectedDate: DateTime.now(),
        dateTextStyle: context.watch<ThemeCubit>().getIsDark
            ? Styles.title14Dark.copyWith(fontWeight: FontWeight.w700)
            : Styles.title14Light.copyWith(fontWeight: FontWeight.w700),
        dayTextStyle: context.watch<ThemeCubit>().getIsDark
            ? Styles.title14Dark.copyWith(
                color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w600)
            : Styles.title14Light.copyWith(
                color: Colors.grey[700],
                fontSize: 11,
                fontWeight: FontWeight.w600),
        monthTextStyle: context.watch<ThemeCubit>().getIsDark
            ? Styles.title14Dark.copyWith(
                color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w600)
            : Styles.title14Light.copyWith(
                color: Colors.grey[700],
                fontSize: 11,
                fontWeight: FontWeight.w600),
        onDateChange: (date) {
          BlocProvider.of<NotesCubit>(context)
              .getNotes(DateFormat.yMd().format(date));
        },
      ),
    );
  }
}
