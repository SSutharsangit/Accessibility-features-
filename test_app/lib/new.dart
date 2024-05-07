import 'package:accessibility_features/accessibility_features.dart';
import 'package:accessibility_features/accessibility_screen.dart';
import 'package:accessibility_features/accessible_heading_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AccessibilityFeatures>(
      builder: (context, accessibilityFeatures, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Accessibility Features'),
            actions: [
              Builder(
                // Wrap the IconButton with Builder widget
                builder: (context) => IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Use the context from the Builder
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccessibilityScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          body: const Padding(
            padding: EdgeInsets.all(20),
            child: AccessibleHeadingText(
              "Hello This is Accessibility...",
              style: TextStyle(fontSize: 30),
            ),
          ),
        );
      },
    );
  }
}
