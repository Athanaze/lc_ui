import 'package:flutter/material.dart';

/// A custom text field widget with optional password visibility toggle.
class LCTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool? autofocus;

  /// Creates an [LCTextField].
  ///
  /// [hintText] is required. [controller] is for the controller of the material text field.
  const LCTextField(
      {super.key,
      required this.hintText,
      this.isPassword = false,
      this.controller,
      this.onChanged,
      this.autofocus});

  @override
  LCTextFieldState createState() => LCTextFieldState();
}

class LCTextFieldState extends State<LCTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      onChanged: widget.onChanged,
      autofocus: widget.autofocus ?? false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300, // Light weight
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
