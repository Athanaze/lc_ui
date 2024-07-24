import 'package:flutter/material.dart';
import 'package:lc_ui/Selectable.dart';

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
class LCheaderMedium extends StatelessWidget {
  /// Header text content.
  final String text;

  /// Creates a medium header.
  /// [text] is required for content display.
  const LCheaderMedium(this.text, {super.key});

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

  /// Creates a regular text.
  /// [text] is required for content display.
  const LCText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return LCSelectable(
      text: text,
      style: const TextStyle(fontSize: 14),
    );
  }
}
