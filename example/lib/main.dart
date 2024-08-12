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
        LCTextField(
          hintText: "John Doe",
          autofocus: true,
        ),
        LCTextField(
          hintText: "Email address",
          errorMessage: "Please enter a valid email address",
          validator: (value) {
            print(
                "value: $value, contains @: ${value.contains("@")}, contains .: ${value.contains(".")}");
            return (value.contains("@") && value.contains("."));
          },
        ),
        LCTextField(
          hintText: "Phone number",
          errorMessage: "Phone number must be 10 digits",
          validator: (value) {
            return !(value.isEmpty);
          },
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
          title: 'Completed Case with Close Button Quelles sont les caractéristiques essentiel  lesa que vous recherchez dans une colocation (budget, quartier, type de logement, etc.)?',
          date: '2023-04-15',
          status: CaseStatus.finished,
          onTap: () {},
          tooltip: "This is a tooltip",
          showCloseButton: true,
          onClose: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Close button pressed!')),
            );
          },
        ),
        const LCSpacer(),
        LCCard(
          title: 'Case Without Status',
          date: '2023-04-10',
          onTap: () {},
          tooltip: "This is a tooltip",
        ),
        const LCSpacer(),
        LCCarousel(
          height: 200,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          onPageChanged: (index) => {
            //print('Page changed to $index')
          },
          cards: [
            LCCard(
                title: 'Padded 1',
                date: '2023-05-01',
                onTap: () {},
                content: const LCText("This is a padded card")),
            LCCard(title: 'Padded 2', date: '2023-05-02', onTap: () {}),
            LCCard(title: 'Padded 3', date: '2023-05-03', onTap: () {}),
          ],
        ),
        const LCCarousel(
          cards: [
            LCTestimonialCard(
              testimonial: "This product has revolutionized our workflow!",
              authorName: "John Doe",
              authorTitle: "CEO, Tech Innovators",
              date: "2023-05-15",
              avatarUrl: "https://i.imgur.com/jiJL6ZH.png",
            ),
            LCTestimonialCard(
              testimonial:
                  "The customer support is top-notch. Highly recommended!",
              authorName: "Jane Smith",
              authorTitle: "CTO, Digital Solutions",
              date: "2023-05-10",
              avatarUrl: "https://i.imgur.com/PyeUwrD.png",
            ),
            LCTestimonialCard(
              testimonial:
                  "We've seen a 50% increase in productivity since implementing this solution.",
              authorName: "Mike Johnson",
              authorTitle: "Operations Manager, Global Corp",
              date: "2023-05-05",
              avatarUrl: "https://i.imgur.com/jiJL6ZH.png",
            ),
          ],
        ),
      ],
    );
  }
}