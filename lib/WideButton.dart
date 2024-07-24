import 'package:flutter/material.dart';

/// Defines common styles for buttons
class ButtonStyles {
  static const padding = 16.0;
  static const radius = 8.0;
  static const fontSize = 16.0;
  static const borderWidth = 1.0;
}

/// Base class for wide buttons
class _LCBaseWideButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? iconData;
  final Color backgroundColor;
  final Color textColor;
  final bool hasBorder;

  const _LCBaseWideButton({
    required this.text,
    required this.onTap,
    this.iconData,
    required this.backgroundColor,
    required this.textColor,
    this.hasBorder = false,
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
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: ButtonStyles.padding),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(ButtonStyles.radius),
              border: hasBorder
                  ? Border.all(
                      color: textColor,
                      width: ButtonStyles.borderWidth,
                    )
                  : null,
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

/// Primary wide button with black background and white text
class LCWideButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? iconData;

  const LCWideButton({
    super.key,
    required this.text,
    required this.onTap,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return _LCBaseWideButton(
      text: text,
      onTap: onTap,
      iconData: iconData,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
}

/// Secondary wide button with white background, black text, and border
class LCSecondaryWideButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? iconData;

  const LCSecondaryWideButton({
    super.key,
    required this.text,
    required this.onTap,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return _LCBaseWideButton(
      text: text,
      onTap: onTap,
      iconData: iconData,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      hasBorder: true,
    );
  }
}
