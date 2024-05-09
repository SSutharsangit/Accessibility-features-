import 'package:accessibility_features/widget/accessible_text.dart';
import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  const AlignWidget({
    super.key,
    required this.alignment,
    required this.icon,
    required this.text,
  });

  final Function alignment;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        alignment();
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(icon), AccessibleText(text)],
        ),
      ),
    );
  }
}
