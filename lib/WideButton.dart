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
  final String? tooltip;

  const _LCBaseWideButton({
    required this.text,
    required this.onTap,
    this.iconData,
    required this.backgroundColor,
    required this.textColor,
    this.hasBorder = false,
    this.tooltip,
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
      tooltip: tooltip,
    );
  }
}

/// Primary wide button with black background and white text
class LCWideButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? iconData;
  final String? tooltip;

  const LCWideButton({
    super.key,
    required this.text,
    required this.onTap,
    this.iconData,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return _LCBaseWideButton(
      text: text,
      onTap: onTap,
      iconData: iconData,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      tooltip: tooltip,
    );
  }
}

/// Secondary wide button with white background, black text, and border
class LCSecondaryWideButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? iconData;
  final String? tooltip;

  const LCSecondaryWideButton({
    super.key,
    required this.text,
    required this.onTap,
    this.iconData,
    this.tooltip,
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
      tooltip: tooltip,
    );
  }
}
