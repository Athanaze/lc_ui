import 'package:flutter/material.dart';

class LCClickable extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const LCClickable({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  LCClickableState createState() => LCClickableState();
}

class LCClickableState extends State<LCClickable> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor:
          widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: widget.onTap,
        child: widget.child,
      ),
    );
  }
}
