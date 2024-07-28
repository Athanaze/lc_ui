import 'package:flutter/material.dart';
import 'package:lc_ui/Button.dart';
import 'package:lc_ui/Theme.dart';

/// A customizable text button with optional border and hover effect.
class LCTextButton extends StatefulWidget {
  /// Creates an LCTextButton.
  const LCTextButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.border = false});

  /// The text to display on the button.
  final String text;

  /// The callback to be invoked when the button is tapped.
  final VoidCallback onTap;

  /// Whether the button should have a border.
  final bool border;

  @override
  State<LCTextButton> createState() => _LCTextButtonState();
}

class _LCTextButtonState extends State<LCTextButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            constraints: const BoxConstraints(minWidth: 100),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ButtonStyles.radius),
              border: widget.border ? LCButtonBorder() : null,
            ),
            child: Text(
              widget.text.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: widget.border
                    ? Colors.black
                    : (_isHovered
                        ? AppTheme.hoverAccentColor
                        : AppTheme.accentColor),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
