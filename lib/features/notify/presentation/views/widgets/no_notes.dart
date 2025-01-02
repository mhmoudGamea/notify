import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/styles.dart';

class NoNotes extends StatelessWidget {
  final String message;
  const NoNotes({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Image.asset(Assets.imagesNoNote, width: 200),
            Text(
              message,
              style: Styles.title15Light.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
