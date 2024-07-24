import 'package:flutter/material.dart';

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
    return Container(
      constraints: const BoxConstraints(
        minWidth: 0,
        minHeight: 0,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click, // Change cursor to pointer
        child: GestureDetector(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: tooltip != null
                ? Tooltip(
                    message: tooltip!,
                    child: IconTheme(
                      data: IconThemeData(color: color), // Apply color
                      child: icon,
                    ),
                  )
                : IconTheme(
                    data: IconThemeData(color: color), // Apply color
                    child: icon,
                  ),
          ),
        ),
      ),
    );
  }
}
