import 'package:flutter/material.dart';

import 'Button.dart';

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
    return LCBaseButton(
      text: text,
      onTap: onTap,
      iconData: iconData,
      backgroundColor: backgroundColor,
      textColor: textColor,
      hasBorder: hasBorder,
      width: double.infinity,
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
