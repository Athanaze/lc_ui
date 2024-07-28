import 'package:flutter/material.dart';
import 'Clickable.dart'; // Make sure to import LCClickable

/// A flatter version of IconButton without splash effect.
class LCIconButton extends StatelessWidget {
  /// The icon to display.
  final Widget icon;

  /// The callback that is called when the button is tapped or pressed.
  final VoidCallback? onPressed;

  /// The text to display in the tooltip.
  final String? tooltip;

  /// The color to apply to the icon.
  final Color? color;

  /// Creates an LCIconButton.
  ///
  /// The [icon] argument must not be null.
  const LCIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return LCClickable(
      onTap: onPressed,
      tooltip: tooltip,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconTheme(
            data: IconThemeData(color: color),
            child: icon,
          ),
        ),
      ),
    );
  }
}
