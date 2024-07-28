import 'package:flutter/material.dart';
import 'package:lc_ui/Text.dart';

import 'Clickable.dart';

enum CaseStatus {
  inProgress,
  finished,
  // Add more statuses as needed
}

class LCCard extends StatelessWidget {
  final String title;
  final String date;
  final CaseStatus? status;
  final VoidCallback onTap;
  final String? tooltip;

  const LCCard({
    Key? key,
    required this.title,
    required this.date,
    this.status,
    required this.onTap,
    this.tooltip,
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LCHeaderMedium(title),
              const SizedBox(height: 4),
              LCInfoText(date),
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
            ],
          ),
        ),
      ),
    );
  }
}
