import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:notify/core/utils/app_theme.dart';
import 'package:notify/core/utils/styles.dart';

class CTextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onPress;
  const CTextButton({
    Key? key,
    required this.text,
    this.textColor = Colors.white,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      style: const NeumorphicStyle(
        color: AppTheme.darkBlue,
        depth: 0,
      ),
      onPressed: onPress,
      child: Text(
        text,
        style: Styles.title15Light.copyWith(color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
