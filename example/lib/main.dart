import 'package:flutter/material.dart';
import 'package:lc_ui/Text.dart';
import 'package:lc_ui/lc_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LCApp(
      title: 'UI Kit Demo',
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
        const LCHeaderSmall('Small header'),
        const LCSpacer(),
        LCWideButton(text: "SAVE", onTap: () {}),
      ], // Optional: You can customize the title
    );
  }
}
