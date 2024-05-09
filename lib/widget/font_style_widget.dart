import 'package:flutter/material.dart';

import 'accessible_heading_text.dart';

class FontStyleWidget extends StatefulWidget {
  final Function increaseFontSize;
  final Function decreaseFontSize;
  final String title;
  final int fontSize;

  const FontStyleWidget({
    super.key,
    required this.increaseFontSize,
    required this.decreaseFontSize,
    required this.fontSize,
    required this.title,
  });

  @override
  State<FontStyleWidget> createState() => _FontStyleWidgetState();
}

class _FontStyleWidgetState extends State<FontStyleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AccessibleHeadingText(
              widget.title,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(width: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    widget.decreaseFontSize();

                    setState(() {});
                  },
                  tooltip: 'Decrease Font Size',
                ),
                // Text(
                //   widget.fontSize == 0
                //       ? "Default"
                //       : '${(widget.fontSize).toStringAsFixed(0)}%',
                //   style: const TextStyle(fontSize: 16.0),
                // ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    widget.increaseFontSize();

                    setState(() {});
                  },
                  tooltip: 'Increase Font Size',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
