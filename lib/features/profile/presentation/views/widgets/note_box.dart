import 'package:flutter/material.dart';
import 'package:notify/core/utils/styles.dart';

class NoteBox extends StatelessWidget {
  final String image;
  final Color borderColor;
  final String text;
  const NoteBox(
      {Key? key,
      required this.image,
      required this.borderColor,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      width: 90,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 246, 250, 255),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: borderColor),
                borderRadius: BorderRadius.circular(11)),
            child: Image.asset(image, width: 50),
          ),
          const SizedBox(height: 15),
          FittedBox(
              child: Text(text,
                  style: Styles.title14Light.copyWith(color: Colors.black))),
        ],
      ),
    );
  }
}
