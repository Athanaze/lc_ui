import 'package:flutter/material.dart';
import 'package:lc_ui/IconButton.dart';
import 'package:lc_ui/Selectable.dart';

class LCBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Icon? backIcon;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? titleColor;

  const LCBar({
    super.key,
    required this.title,
    this.backIcon,
    this.onBackPressed,
    this.actions,
    this.backgroundColor,
    this.iconColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      backgroundColor: backgroundColor ?? theme.primaryColor,
      leading: LCIconButton(
        icon: backIcon ?? const Icon(Icons.arrow_back),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
        color: iconColor ?? Colors.white,
      ),
      title: LCSelectable(
        text: title.toUpperCase(),
        style: TextStyle(color: titleColor ?? Colors.white),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
