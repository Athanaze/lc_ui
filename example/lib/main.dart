import 'package:flutter/material.dart';

import 'package:lc_ui/lc_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('UI Kit Demo')),
        body: const UIKitDemo(),
      ),
    );
  }
}

class UIKitDemo extends StatelessWidget {
  const UIKitDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Add your UI kit widgets here
        LCWideButton(onTap: () {}, text: 'Custom Button'),
        const LCSpacer(),
        LCSecondaryWideButton(onTap: () {}, text: 'Custom Button'),

        const LCSpacer(),
        const Text('BUDDY'),
        const LCTextField(
          hintText: "John Doe",
          autofocus: true,
        ),
        const LCTextField(
          hintText: "Email address",
        ),
        const LCTextField(
          hintText: "Phone number",
        ),
        const LCSpacer(),
        LCWideButton(text: "SAVE", onTap: () {}),

        // Add more widgets as needed
      ],
    );
  }
}
