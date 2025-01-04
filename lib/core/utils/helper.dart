import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../features/notify/data/models/my_notes_model.dart';
import '../../features/notify/presentation/model_views/theme/theme_cubit.dart';
import '../config/app_colors.dart';
import '../config/app_style.dart';
import '../config/constants.dart';
import 'bottom_sheet_widget.dart';

enum Message {
  error,
  success,
}

abstract class Helper {
  static final themeCubit = GetIt.I.get<ThemeCubit>();
  static AppBar getAppBar(
      {required VoidCallback onTap,
      required VoidCallback router,
      required IconData icon,
      required Color iconColor,
      double iconSize = 25,
      required String image}) {
    return AppBar(
      leading: GestureDetector(
        onTap: onTap,
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: router,
          child: CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(image),
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  static AppBar getTCDAppBar({
    required VoidCallback onTap,
    required Color iconColor,
    required String title,
    required TextStyle style,
    double iconSize = 24,
  }) {
    return AppBar(
      leading: GestureDetector(
        onTap: onTap,
        child: Icon(
          Icons.arrow_back_ios_rounded,
          size: iconSize,
          color: iconColor,
        ),
      ),
      centerTitle: true,
      title: Text(title, style: style),
    );
  }

  static InputBorder getBorder({Color color = Colors.black}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(width: 1, color: color),
    );
  }

  //this function 'll be called when you press on date input field in add note form
  static Future<DateTime?> getDatePicker(BuildContext context) async {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year).add(const Duration(days: 365)),
      builder: (context, child) {
        return themeCubit.getDateTimeTheme(context, child);
      },
    );
  }

  static Future<TimeOfDay?> getTimePicker(
      BuildContext context, TimeOfDay timeOfDay) async {
    return showTimePicker(
      context: context,
      initialTime: timeOfDay,
      builder: (context, child) {
        return themeCubit.getDateTimeTheme(context, child);
      },
    );
  }

  static toastMessage(BuildContext context,
      {required Message type, required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          height: 80,
          decoration: BoxDecoration(
            color: type == Message.success
                ? AppColors.successColor
                : AppColors.failColor,
            borderRadius: BorderRadius.circular(Constants.borderRadius),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.check,
                color: Colors.white,
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(message, style: AppStyle.font13SemiBold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void mySheet(
      {required BuildContext context, required MyNotesModel notesModel}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetWidget(notesModel: notesModel),
    );
  }
}
