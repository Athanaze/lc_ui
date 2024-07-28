import 'package:flutter/material.dart';

import 'lc_ui.dart';

class LCDialog extends StatelessWidget {
  final String title;
  final String cancelText;
  final String submitText;
  final VoidCallback onCancel;
  final VoidCallback onSubmit;
  final List<Widget> children;

  const LCDialog({
    Key? key,
    required this.title,
    required this.cancelText,
    required this.submitText,
    required this.onCancel,
    required this.onSubmit,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      titlePadding: EdgeInsets.zero,
      title: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LCHeaderMedium(title),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.grey),
              onPressed: onCancel,
              splashRadius: 20,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: LCTextButton(
                text: cancelText,
                onTap: onCancel,
                border: true,
              ),
            ),
            const LCSpacer(),
            Expanded(
              child: LCRegularButton(
                text: submitText,
                onTap: onSubmit,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
