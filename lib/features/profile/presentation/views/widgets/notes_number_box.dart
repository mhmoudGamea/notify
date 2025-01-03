import 'package:flutter/material.dart';

import '../../../../../core/utils/app_theme.dart';

class NotesNumberBox extends StatelessWidget {
  final bool theme;
  final int notesNumber;
  const NotesNumberBox(
      {Key? key, required this.theme, required this.notesNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'You have ',
        style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
            color: theme ? Colors.white : Colors.black),
        children: [
          TextSpan(
            text: '$notesNumber notes',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: AppTheme.darkBlue,
            ),
          ),
          const TextSpan(
            text: ' this month.',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
