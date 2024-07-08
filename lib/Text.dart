import 'package:flutter/material.dart';

class LCHeaderLarge extends StatelessWidget {
  final String text;

  const LCHeaderLarge(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold));
  }
}

class LCheaderMedium extends StatelessWidget {
  final String text;

  const LCheaderMedium(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
  }
}

class LCHeaderSmall extends StatelessWidget {
  final String text;

  const LCHeaderSmall(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }
}
