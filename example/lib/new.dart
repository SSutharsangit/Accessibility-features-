import 'package:accessibility_features/accessibility_features.dart';
import 'package:accessibility_features/accessibility_screen.dart';
import 'package:accessibility_features/widget/accessible_heading_text.dart';
import 'package:accessibility_features/widget/accessible_text.dart';
import 'package:accessibility_features/widget/accessiblity_image.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AccessibilityFeatures>(
      builder: (context, accessibilityFeatures, _) {
        return Scaffold(
          backgroundColor: accessibilityFeatures.textBgColor,
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
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const AccessibleHeadingText(
                  "Hello This is Accessibility...",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 20),
                const AccessibleText(
                  "This is a simple text widget",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {},
                    child: const AccessibleText(
                      "This is a button",
                      style: TextStyle(fontSize: 20),
                    )),
                const AccessibilityImage(
                  image: AssetImage('assets/hello.png'),
                  width: 200,
                  height: 250,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  colorBlendMode: BlendMode.colorBurn,
                  filterQuality: FilterQuality.high,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
