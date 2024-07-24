import 'package:flutter/material.dart';
import 'package:lc_ui/Clickable.dart';
import 'package:lc_ui/Text.dart';

class LCChevronCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? backgroundColor;

  const LCChevronCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return LCClickable(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LCText(title),
                      LCInfoText(subtitle),
                    ],
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
            Container(
              height: 1,
              color: const Color.fromARGB(255, 126, 126, 126),
            ),
          ],
        ),
      ),
    );
  }
}
