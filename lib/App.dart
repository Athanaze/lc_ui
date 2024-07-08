// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:lc_ui/lc_ui.dart';

const MAX_WIDTH = 1000.0;
const APP_PADDING = 16.0;

class LCApp extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final double maxWidth;
  final double appPadding;

  final Icon? backIcon;
  final Function()? onBackPressed;
  final List<Widget>? actions;

  const LCApp(
      {super.key,
      required this.children,
      required this.title,
      this.maxWidth = MAX_WIDTH,
      this.appPadding = APP_PADDING,
      this.backIcon,
      this.onBackPressed,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: LCBar(
            title: title,
            backIcon: backIcon,
            onBackPressed: onBackPressed,
            actions: actions),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Padding(
              padding: EdgeInsets.all(appPadding),
              child: ListView(children: children),
            ),
          ),
        ),
      ),
    );
  }
}
