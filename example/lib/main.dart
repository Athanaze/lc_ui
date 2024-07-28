import 'package:flutter/material.dart';
import 'package:lc_ui/Button.dart';
import 'package:lc_ui/ChevronCard.dart';
import 'package:lc_ui/IconButton.dart';
import 'package:lc_ui/Text.dart';
import 'package:lc_ui/TextButton.dart';
import 'package:lc_ui/WideButton.dart';
import 'package:lc_ui/lc_ui.dart';
import 'package:lc_ui/Card.dart';

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
      actions: const [Text("text on the right")],
      children: [
        const LCHeaderLarge("Large header title"),
        LCWideButton(text: 'Custom Button', onTap: () {}),
        const LCSpacer(),
        LCSecondaryWideButton(onTap: () {}, text: 'Custom Button'),
        const LCSpacer(),
        const LCHeaderMedium('Buddy'),
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
            const LCText("LC Text content"),
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
        const LCSpacer(),
        LCLink(
          text: "This is a link",
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Link tapped!')),
            );
          },
        ),
        const LCSpacer(),
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const LCText("This is a regular LCText example"),
          LCLink(
            text: "This is a link",
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Link tapped!')),
              );
            },
          ),
        ]),
        const LCText("This is a regular LCText example"),
        const LCSpacer(),
        Row(
          children: [
            LCRegularButton(
              tooltip: "This is a tooltip",
              text: "Button",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LCDialog(
                      title: "Dialog Title",
                      cancelText: "Cancel",
                      submitText: "Submit",
                      onCancel: () => Navigator.of(context).pop(),
                      onSubmit: () {
                        Navigator.of(context).pop();
                      },
                      children: const [
                        LCText("This is the dialog content."),
                      ],
                    );
                  },
                );
              },
            ),
            const LCText(
              "This is an LCText with custom style",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            )
          ],
        ),
        const LCSpacer(),
        const LCHeaderMedium('Case Examples'),
        LCCard(
          title: 'Ongoing Case',
          date: '2023-04-20',
          status: CaseStatus.inProgress,
          onTap: () {},
        ),
        const LCSpacer(),
        LCCard(
          title: 'Completed Case',
          date: '2023-04-15',
          status: CaseStatus.finished,
          onTap: () {},
          tooltip: "This is a tooltip",
        ),
        const LCSpacer(),
        LCCard(
          title: 'Case Without Status',
          date: '2023-04-10',
          onTap: () {},
          tooltip: "This is a tooltip",
        ),
        const LCSpacer(),
        const LCSpacer(),
        const LCSpacer(),
        const LCSpacer(),
        const LCSpacer(),
        const LCSpacer(),
        const LCInfoText("This is a regular LCInfoText example",
            tooltip: "This is a 24 hour case"),
      ],
    );
  }
}
