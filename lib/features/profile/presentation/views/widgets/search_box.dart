import 'package:flutter/material.dart';
import 'package:notify/core/utils/app_theme.dart';
import 'package:notify/core/utils/helper.dart';
import 'package:notify/core/utils/styles.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController controller;
  const SearchBox({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppTheme.lightBlue,
        border: Helper.getBorder(color: AppTheme.lightBlue),
        focusedBorder: Helper.getBorder(color: AppTheme.lightBlue),
        enabledBorder: Helper.getBorder(color: AppTheme.lightBlue),
        hintText: 'Search a note by name',
        hintStyle: Styles.title14Light.copyWith(color: Colors.grey[700]),
        prefixIcon: Icon(
          Icons.search_rounded,
          size: 22,
          color: Colors.grey[700],
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      ),
    );
  }
}
