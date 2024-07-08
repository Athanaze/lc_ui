import 'package:flutter/material.dart';

const BUTTON_PADDING = 16.0;
const BUTTON_RADIUS = 8.0;
const BUTTON_FONT_SIZE = 16.0;
const BUTTON_BORDER_WIDTH = 1.0;

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
    return Padding(
      padding: const EdgeInsets.all(BUTTON_PADDING),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: BUTTON_PADDING),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(BUTTON_RADIUS),
            border: hasBorder
                ? Border.all(
              color: textColor,
              width: BUTTON_BORDER_WIDTH,
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
                  fontSize: BUTTON_FONT_SIZE,
                ),
                textAlign: TextAlign.center,
              ),
              if (iconData != null) ...[
                const SizedBox(width: BUTTON_FONT_SIZE/2),
                Icon(iconData, size: BUTTON_FONT_SIZE, color: textColor),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

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
