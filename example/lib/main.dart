import 'package:flutter/material.dart';
import 'package:lc_ui/ChevronCard.dart';
import 'package:lc_ui/IconButton.dart';
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
        const LCSpacer(),
        LCIconButton(
            icon: const Icon(Icons.add),
            tooltip: "This is a tooltip",
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Added successfully!'),
                  duration: Duration(seconds: 2),
                ),
              );
            }),
        const LCSpacer(),
        LCChevronCard(
          title: "Title",
          subtitle: "Subtitle",
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Chevron card tapped!'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
