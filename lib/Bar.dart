import 'package:flutter/material.dart';

class LCBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData backIcon;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;

  const LCBar(
      {super.key,
      required this.title,
      this.backIcon = Icons.arrow_back,
      this.onBackPressed,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(backIcon),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
        color: Colors.white,
      ),
      title: Text(title.toUpperCase(),
          style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
