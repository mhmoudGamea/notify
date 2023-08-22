import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:notify/core/utils/styles.dart';

class CExpandedTextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onPress;
  final Color bgColor;
  final Color? borderColor;
  const CExpandedTextButton({
    Key? key,
    required this.text,
    this.textColor = Colors.white,
    required this.onPress,
    required this.bgColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NeumorphicButton(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            style: NeumorphicStyle(
                color: bgColor,
                depth: 0,
                border: NeumorphicBorder(
                    color: borderColor ?? bgColor, width: 1.2)),
            onPressed: onPress,
            child: Text(
              text,
              style: Styles.title16Light.copyWith(
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
