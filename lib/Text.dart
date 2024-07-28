import 'package:flutter/material.dart';
import 'package:lc_ui/Selectable.dart';

import 'Clickable.dart';
import 'package:lc_ui/Theme.dart';

/// Large header with adaptive text selection.
/// Uses [LCSelectable] for cross-platform consistency.
class LCHeaderLarge extends StatelessWidget {
  /// Header text content.
  final String text;

  /// Creates a large header.
  /// [text] is required for content display.
  const LCHeaderLarge(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return LCSelectable(
      text: text,
      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }
}

/// Medium header with adaptive text selection.
/// Ensures consistent appearance across platforms.
class LCHeaderMedium extends StatelessWidget {
  /// Header text content.
  final String text;

  /// Creates a medium header.
  /// [text] is required for content display.
  const LCHeaderMedium(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return LCSelectable(
      text: text,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

/// Small header with adaptive text selection.
/// Maintains uniform behavior on different platforms.
class LCHeaderSmall extends StatelessWidget {
  /// Header text content.
  final String text;

  /// Creates a small header.
  /// [text] is required for content display.
  const LCHeaderSmall(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return LCSelectable(
      text: text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

/// Regular text with adaptive text selection.
/// Ensures consistent appearance across platforms.
class LCText extends StatelessWidget {
  /// Text content.
  final String text;

  /// Optional style to override the default.
  final TextStyle? style;

  /// Creates a regular text.
  /// [text] is required for content display.
  /// [style] is optional and overrides the default style if provided.
  const LCText(this.text, {this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return LCSelectable(
      text: text,
      style: style ?? const TextStyle(fontSize: 14),
    );
  }
}

/// A clickable text link with adaptive text selection.
/// Provides a tappable text that can trigger an action.
class LCLink extends StatelessWidget {
  /// The text to be displayed as a link.
  final String text;

  /// The function to be called when the link is tapped.
  final VoidCallback onTap;

  /// Optional style to override the default.
  final TextStyle? style;

  /// Creates a clickable text link.
  /// [text] is the content to be displayed.
  /// [onTap] is the function to be executed when the link is tapped.
  /// [style] is optional and overrides the default style if provided.
  const LCLink({
    required this.text,
    required this.onTap,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double underlineY = 2.0;
    final decorationColor = AppTheme.accentColor;
    return LCClickable(
      onTap: onTap,
      child: Transform.translate(
        offset: const Offset(0, underlineY),
        child: Text(
          text,
          style: TextStyle(
            shadows: [
              Shadow(
                  color: decorationColor, offset: const Offset(0, -underlineY))
            ],
            color: Colors.transparent,
            decoration: TextDecoration.underline,
            decorationColor: decorationColor,
            decorationThickness: 2,
          ),
        ),
      ),
    );
  }
}

/// Small info text with adaptive text selection.
/// Displays text in a smaller, gray font for informational purposes.
class LCInfoText extends StatelessWidget {
  /// Text content.
  final String text;

  /// Creates a small info text.
  /// [text] is required for content display.
  const LCInfoText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return LCSelectable(
      text: text,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    );
  }
}
