import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        style: GoogleFonts.nunito(
            fontSize: 23,
            fontWeight: FontWeight.w800,
            color: theme ? Colors.white : Colors.black),
        children: [
          TextSpan(
            text: '$notesNumber notes',
            style: GoogleFonts.nunito(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: AppTheme.darkBlue,
            ),
          ),
          TextSpan(
            text: ' this month.',
            style: GoogleFonts.nunito(
              fontSize: 23,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
