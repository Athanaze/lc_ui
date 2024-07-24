import 'package:flutter/material.dart';
import 'package:lc_ui/Bar.dart';

class AppStyles {
  static const double maxWidth = 1000.0;
  static const double appPadding = 16.0;
}

class LCApp extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final double maxWidth;
  final double appPadding;

  final Icon? backIcon;
  final Function()? onBackPressed;
  final List<Widget>? actions;

  const LCApp({
    super.key,
    required this.children,
    required this.title,
    this.maxWidth = AppStyles.maxWidth,
    this.appPadding = AppStyles.appPadding,
    this.backIcon,
    this.onBackPressed,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LCBar(
        title: title,
        backIcon: backIcon,
        onBackPressed: onBackPressed,
        actions: actions,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Padding(
            padding: EdgeInsets.all(appPadding),
            child: ListView(children: children),
          ),
        ),
      ),
    );
  }
}
