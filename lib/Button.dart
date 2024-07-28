import 'package:flutter/material.dart';

Border LCButtonBorder() {
  return Border.all(color: Colors.black, width: 1);
}

/// Defines common styles for buttons
class ButtonStyles {
  static const padding = 16.0;
  static const radius = 8.0;
  static const fontSize = 16.0;
}

class LCBaseButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? iconData;
  final Color backgroundColor;
  final Color textColor;
  final bool hasBorder;
  final double? width;

  const LCBaseButton({
    required this.text,
    required this.onTap,
    this.iconData,
    required this.backgroundColor,
    required this.textColor,
    this.hasBorder = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.all(ButtonStyles.padding),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(
                vertical: ButtonStyles.padding,
                horizontal: ButtonStyles.padding * 2),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(ButtonStyles.radius),
              border: hasBorder ? LCButtonBorder() : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: ButtonStyles.fontSize,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (iconData != null) ...[
                  const SizedBox(width: ButtonStyles.fontSize / 2),
                  Icon(iconData, size: ButtonStyles.fontSize, color: textColor),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LCRegularButton extends LCBaseButton {
  const LCRegularButton({
    required super.text,
    required super.onTap,
    super.iconData,
    super.width,
  }) : super(
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
}
