import 'package:flutter/material.dart';

class LCTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool? autofocus;
  final String? errorMessage;
  final bool Function(String)? validator;

  const LCTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.autofocus,
    this.errorMessage,
    this.validator,
  });

  @override
  LCTextFieldState createState() => LCTextFieldState();
}

class LCTextFieldState extends State<LCTextField> {
  bool _obscureText = true;
  bool _showError = false;
  final FocusNode _focusNode = FocusNode();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      _validateInput();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          obscureText: widget.isPassword ? _obscureText : false,
          onChanged: (value) {
            widget.onChanged?.call(value);
            setState(() => _showError = false);
          },
          autofocus: widget.autofocus ?? false,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
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
        ),
        if (_showError && widget.errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              widget.errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }

  void _validateInput() {
    if (widget.validator != null) {
      setState(() {
        _showError = !widget.validator!(_controller.text);
      });
    }
  }
}
