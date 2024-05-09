// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'accessible_heading_text.dart';
import 'accessible_text.dart';

class AccessibilityListItem extends StatelessWidget {
  final String titleText;
  String? description;
  final bool value;
  final Function(bool)? onChanged;

  AccessibilityListItem({
    super.key,
    required this.titleText,
    this.description,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.blue,
            // inactiveThumbColor: Colors.blue,
            // trackColor: MaterialStateColor.resolveWith(
            //   (states) => Colors.blue.withOpacity(0.5),
            // ),
            // trackOutlineColor: MaterialStateColor.resolveWith(
            //   (states) => Colors.blue.withOpacity(0.5),
            // ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AccessibleHeadingText(
                titleText,
                style: const TextStyle(
                    fontSize: 17.0, fontWeight: FontWeight.w500),
              ),
              if (description != null)
                AccessibleText(
                  description!,
                  style: const TextStyle(fontSize: 14.0),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
