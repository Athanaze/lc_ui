import 'package:flutter/material.dart';

/// A customizable text area widget with consistent styling.
///
/// Provides a multi-line text input field with customizable appearance
/// and behavior, including hint text, focus handling, and text input controls.
class LCTextarea extends StatelessWidget {
  final String hintText;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  /// Creates an [LCTextarea] widget.
  ///
  /// The [hintText] parameter is required. Other parameters are optional
  /// and allow for customization of the text area's behavior and appearance.
  const LCTextarea({
    super.key,
    required this.hintText,
    this.focusNode,
    this.minLines,
    this.maxLines,
    this.controller,
    this.onChanged,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.sentences,
  });

  // Constants for styling
  static const double _borderRadius = 8.0;
  static const double _focusedBorderWidth = 2.0;
  static const int _defaultMinLines = 5;

  static const TextStyle _textStyle = TextStyle(color: Colors.black);
  static const TextStyle _hintStyle = TextStyle(color: Colors.grey);

  static final BorderRadius _borderRadiusAll =
      BorderRadius.circular(_borderRadius);

  @override
  Widget build(BuildContext context) {
    return TextSelectionTheme(
      data: TextSelectionThemeData(
        selectionColor: Colors.grey.withOpacity(0.3),
        cursorColor: Colors.grey,
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        maxLines: maxLines ?? null,
        minLines: minLines ?? _defaultMinLines,
        onChanged: onChanged,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        style: _textStyle,
        decoration: InputDecoration(
          border: _buildBorder(),
          hintText: hintText,
          hintStyle: _hintStyle,
          filled: true,
          fillColor: Colors.white,
          focusedBorder: _buildBorder(width: _focusedBorderWidth),
          enabledBorder: _buildBorder(),
        ),
      ),
    );
  }

  /// Constructs an [OutlineInputBorder] with consistent styling.
  ///
  /// [width] specifies the border width, defaulting to 1.0.
  OutlineInputBorder _buildBorder({double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: _borderRadiusAll,
      borderSide: BorderSide(color: Colors.black, width: width),
    );
  }
}
