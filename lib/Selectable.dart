import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

/// A widget that displays text and adapts its behavior based on the platform.
///
/// On web platforms, it renders as selectable text, while on other platforms,
/// it renders as regular text.
class LCSelectable extends StatelessWidget {
  /// The text to be displayed.
  final String text;

  /// The style to apply to the text.
  final TextStyle style;

  /// Creates an [LCSelectable] widget.
  ///
  /// [text] is the string to be displayed.
  /// [style] is the [TextStyle] to apply to the text.
  const LCSelectable({
    required this.text,
    required this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? SelectableText(text, style: style)
        : Text(text, style: style);
  }
}
