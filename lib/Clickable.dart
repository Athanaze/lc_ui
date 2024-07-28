import 'package:flutter/material.dart';

class LCClickable extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final String? tooltip;

  const LCClickable({
    super.key,
    required this.child,
    this.onTap,
    this.tooltip,
  });

  @override
  LCClickableState createState() => LCClickableState();
}

class LCClickableState extends State<LCClickable> {
  @override
  Widget build(BuildContext context) {
    Widget content = MouseRegion(
      cursor:
          widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: widget.onTap,
        child: widget.child,
      ),
    );

    if (widget.tooltip != null) {
      content = Tooltip(
        message: widget.tooltip!,
        child: content,
      );
    }

    return content;
  }
}
