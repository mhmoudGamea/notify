import 'package:flutter/material.dart';
import 'package:notify/core/utils/styles.dart';

import '../../../../../core/utils/helper.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool readOnly;
  final bool enableIcon;
  final IconData? icon;
  final VoidCallback? onPress;
  final int maxLines;
  final TextEditingController? controller;
  const InputField(
      {Key? key,
      required this.hint,
      this.readOnly = false,
      this.enableIcon = false,
      this.icon,
      this.onPress,
      this.maxLines = 1,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 15),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.grey[600],
        readOnly: readOnly,
        maxLines: maxLines,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: Styles.title15Light,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            enabledBorder: Helper.getBorder(),
            focusedBorder: Helper.getBorder(),
            disabledBorder: Helper.getBorder(),
            border: Helper.getBorder(),
            suffixIcon: enableIcon
                ? IconButton(
                    onPressed: onPress,
                    icon: Icon(
                      icon,
                      size: 25,
                      color: Colors.grey,
                    ),
                  )
                : null),
      ),
    );
  }
}
