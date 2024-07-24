import 'package:flutter/material.dart';

/// A custom spacer widget that adds vertical space.
class LCSpacer extends StatelessWidget {
  /// Creates an [LCSpacer] widget.
  const LCSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    /// Returns a SizedBox with a fixed height of 16 logical pixels.
    return const SizedBox(height: 16);
  }
}
