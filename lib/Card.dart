import 'package:flutter/material.dart';
import 'package:lc_ui/Text.dart';

import 'Clickable.dart';
import 'lc_ui.dart';

enum CaseStatus {
  inProgress,
  finished,
  // Add more statuses as needed
}

class LCCard extends StatelessWidget {
  final String title;
  final String? date;
  final CaseStatus? status;
  final VoidCallback onTap;
  final String? tooltip;
  final Widget? content; // New optional content parameter
  final bool showCloseButton; // New parameter
  final VoidCallback? onClose; // New parameter

  const LCCard({
    Key? key,
    required this.title,
    required this.date,
    this.status,
    required this.onTap,
    this.tooltip,
    this.content, // Add content to the constructor
    this.showCloseButton = false, // Default to false
    this.onClose,
  }) : super(key: key);

  Color _getStatusColor(CaseStatus status) {
    switch (status) {
      case CaseStatus.finished:
        return Colors.green;
      case CaseStatus.inProgress:
        return Colors.blue;
      // Add more cases as needed
      default:
        return Colors.grey; // Default color
    }
  }

  String _getStatusText(CaseStatus status) {
    switch (status) {
      case CaseStatus.finished:
        return 'Affaire finie';
      case CaseStatus.inProgress:
        return 'En cours';
      // Add more cases as needed
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return LCClickable(
      tooltip: tooltip ?? title,
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LCHeaderMedium(title),
                  const SizedBox(height: 4),
                  if (date != null) LCInfoText(date!),
                  if (status != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(status!),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _getStatusText(status!),
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ],
                  if (content != null) ...[
                    const SizedBox(height: 8),
                    content!, // Add the optional content widget
                  ],
                ],
              ),
            ),
            if (showCloseButton)
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: onClose,
                  behavior: HitTestBehavior.opaque,
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      '×',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class LCTestimonialCard extends StatelessWidget {
  final String? title;
  final String testimonial;
  final String authorName;
  final String? authorTitle;
  final String date;
  final VoidCallback? onTap;
  final String? tooltip;
  final String? avatarUrl;
  final Widget? additionalContent;
  final TextStyle? testimonialStyle;
  final TextStyle? authorStyle;

  const LCTestimonialCard({
    super.key,
    this.title,
    required this.testimonial,
    required this.authorName,
    this.authorTitle,
    required this.date,
    this.onTap,
    this.tooltip,
    this.avatarUrl,
    this.additionalContent,
    this.testimonialStyle,
    this.authorStyle,
  });

  @override
  Widget build(BuildContext context) {
    return LCCard(
      title: title ?? '',
      date: date,
      onTap: onTap ?? () {},
      tooltip: tooltip,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LCHeaderSmall(testimonial),
          const LCSpacer(),
          Row(
            children: [
              if (avatarUrl != null) ...[
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl!),
                  radius: 24,
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authorName,
                      style: authorStyle ??
                          const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                    ),
                    if (authorTitle != null)
                      Text(
                        authorTitle!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (additionalContent != null) ...[
            const SizedBox(height: 16),
            additionalContent!,
          ],
        ],
      ),
    );
  }
}