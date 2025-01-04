import 'package:flutter/material.dart';
import 'package:notify/core/utils/styles.dart';

import '../../../../../core/utils/helper.dart';

class InputField extends StatelessWidget {
  final String? hint;
  final bool readOnly;
  final IconData? icon;
  final VoidCallback? onPress;
  final TextEditingController? controller;
  const InputField(
      {Key? key,
      this.hint,
      this.readOnly = false,
      this.icon,
      this.onPress,
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
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Styles.title14Light,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          enabledBorder: Helper.getBorder(),
          focusedBorder: Helper.getBorder(),
          disabledBorder: Helper.getBorder(),
          border: Helper.getBorder(),
          suffixIcon: IconButton(
            onPressed: onPress,
            icon: Icon(
              icon,
              size: 22,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
