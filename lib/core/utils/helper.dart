import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:notify/core/utils/styles.dart';
import 'package:notify/features/notify/data/models/my_notes_model.dart';
import 'package:notify/features/notify/presentation/model_views/theme/theme_cubit.dart';

import 'bottom_sheet_widget.dart';

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

  static InputBorder getBorder({Color color = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1.2, color: color),
      gapPadding: 10,
    );
  }

  //this function 'll be called when you press on date input field in add note form
  static Future<DateTime?> getDatePicker(BuildContext context) async {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
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

  static void showCustomToast({
    required BuildContext context,
    required Color bgColor,
    required IconData icon,
    required String msg,
  }) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: bgColor),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                msg,
                style: Styles.title14Light.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
    fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
      fadeDuration: const Duration(milliseconds: 500),
      gravity: ToastGravity.BOTTOM,
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
