import 'package:flutter/material.dart';
import 'package:lc_ui/Text.dart';
import 'package:lc_ui/TextButton.dart';
import 'package:lc_ui/lc_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LCApp(
      title: 'Ui kit demo',
      actions: [Text("21342142314234")],
      children: [
        const LCHeaderLarge("Large header title"),
        LCWideButton(text: 'Custom Button', onTap: () {}),
        const LCSpacer(),
        LCSecondaryWideButton(onTap: () {}, text: 'Custom Button'),
        const LCSpacer(),
        const LCheaderMedium('Buddy'),
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
        Row(
          children: [
            const LCHeaderSmall('Small header'),
            LCTextButton(
              text: "Button with border",
              onTap: () {},
              border: true,
            ),
            LCTextButton(
              text: "text button",
              onTap: () {},
            ),
            LCText("LC Text content"),
          ],
        ),
        const LCSpacer(),
        LCWideButton(text: "SAVE", onTap: () {}),
      ], // Optional: You can customize the title
    );
  }
}
