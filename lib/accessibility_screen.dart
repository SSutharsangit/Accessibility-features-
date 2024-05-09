import 'package:accessibility_features/accessibility_features.dart';
import 'package:accessibility_features/widget/accessible_heading_text.dart';
import 'package:accessibility_features/widget/accessible_text.dart';
import 'package:accessibility_features/widget/align_widget.dart';
import 'package:accessibility_features/widget/colorpicker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget/accessibility_list_item.dart';
import 'widget/font_style_widget.dart';

class AccessibilityScreen extends StatelessWidget {
  const AccessibilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AccessibilityFeatures>(
      builder: (context, accessibilitySettings, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Accessibility Features',
          themeMode: accessibilitySettings.systemMode
              ? ThemeMode.system
              : (accessibilitySettings.isDark
                  ? ThemeMode.dark
                  : ThemeMode.light),
          darkTheme: accessibilitySettings.darkTheme,
          theme: accessibilitySettings.lightTheme,
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AccessibilityFeatures accessibilityFeatures = AccessibilityFeatures();

  @override
  Widget build(BuildContext context) {
    final accessibilitySettings = context.watch<AccessibilityFeatures>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AccessibleHeadingText(
              "Accessibility Modes",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            AccessibilityListItem(
              titleText:
                  accessibilitySettings.isDark ? 'light mode' : 'Dark mode',
              description: 'Enable or disable dark mode',
              value: accessibilitySettings.isDark,
              onChanged: ((accessibilitySettings.monochrome == false) &&
                      accessibilitySettings.systemMode == false)
                  ? (value) => accessibilitySettings.changeTheme()
                  : null,
            ),

            AccessibilityListItem(
              titleText: 'System default mode',
              description: 'Enable or disable system mode',
              value: accessibilitySettings.systemMode,
              onChanged: ((accessibilitySettings.isDark == false) &&
                      (accessibilitySettings.monochrome == false))
                  ? (value) => accessibilitySettings.toggleSystem()
                  : null,
            ),
            AccessibilityListItem(
              titleText: "Monochrome",
              value: accessibilitySettings.monochrome == true,
              onChanged: (value) {
                accessibilitySettings.toggleMonochrome();
                // _updateTheme(context);
              },
            ),

            AccessibilityListItem(
              titleText: "Visually Impaired Mode",
              value: accessibilitySettings.impairedMode,
              onChanged: (value) {
                accessibilitySettings.toggleimpairedMode();
                // _updateTheme(context);
              },
            ),

            AccessibilityListItem(
              titleText: "Cognitive Disability  mode",
              value: accessibilitySettings.cognitiveMode,
              onChanged: (value) {
                accessibilitySettings.togglecognitiveModeMode();
                // _updateTheme(context);
              },
            ),

            // AccessibilityListItem(
            //   titleText: "ADHD  mode",
            //   value: accessibilitySettings.adhd,
            //   onChanged: (value) {
            //     accessibilitySettings.toggleADHDMode();
            //   },
            // ),

            AccessibilityListItem(
              titleText: accessibilitySettings.imageVisibility
                  ? 'Hide Image'
                  : 'Show Image',
              value: !accessibilitySettings.imageVisibility,
              onChanged: (value) {
                accessibilitySettings.hideImage();
                // _updateTheme(context);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),

            const AccessibleHeadingText(
              " Readable Experience",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),

            FontStyleWidget(
                increaseFontSize: accessibilitySettings.increaseFontSize,
                decreaseFontSize: accessibilitySettings.decreaseFontSize,
                fontSize: accessibilitySettings.currentFontSize.toInt(),
                title: 'Font Size'),

            FontStyleWidget(
              title: 'Line Height',
              fontSize: accessibilitySettings.lineHeight.toInt(),
              increaseFontSize: accessibilitySettings.increaseLineHeight,
              decreaseFontSize: accessibilitySettings.decreaseLineHeight,
            ),

            FontStyleWidget(
              title: 'Letter Space',
              fontSize: accessibilitySettings.letterSpacing.toInt(),
              increaseFontSize: accessibilitySettings.increaseLetterSpace,
              decreaseFontSize: accessibilitySettings.decreaseLetterSpace,
            ),

            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AlignWidget(
                    alignment: () {
                      accessibilitySettings.setTextAlignment(TextAlign.left);
                    },
                    icon: Icons.align_horizontal_left,
                    text: "Left Aligned"),
                AlignWidget(
                    alignment: () {
                      accessibilitySettings.setTextAlignment(TextAlign.center);
                    },
                    icon: Icons.align_horizontal_center,
                    text: "Center Aligned"),
                AlignWidget(
                  alignment: () {
                    accessibilitySettings.setTextAlignment(TextAlign.right);
                  },
                  icon: Icons.align_horizontal_right,
                  text: "Right Aligned",
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const AccessibleHeadingText(
              "Visually Pleasing Experience",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            // color change
            // ListTile(
            //   title: const AccessibleHeadingText('Heading Color ',
            //       style: TextStyle(fontSize: 17.0)),
            //   trailing: SizedBox(
            //     width: 150.0,
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         IconButton(
            //           icon: const Icon(
            //             Icons.color_lens,
            //             color: Colors.red,
            //           ),
            //           onPressed: () {
            //             accessibilitySettings.setHeadingColor(Colors.red);
            //           },
            //         ),
            //         IconButton(
            //           icon: const Icon(
            //             Icons.color_lens,
            //             color: Colors.green,
            //           ),
            //           onPressed: () {
            //             accessibilitySettings.setHeadingColor(Colors.green);
            //           },
            //         ),
            //         ColorPickerIconButton(
            //           key: UniqueKey(),
            //           title: "heading",
            //           onPressed: (Color selectedColor, String heading) {
            //             // Your onPressed callback logic here
            //             accessibilitySettings.setHeadingColor(selectedColor);
            //           },
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // ListTile(
            //   title: const AccessibleHeadingText('Adjust Text Colors',
            //       style: TextStyle(fontSize: 17.0)),
            //   trailing: SizedBox(
            //     width: 150.0,
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         IconButton(
            //           icon: const Icon(Icons.color_lens, color: Colors.red),
            //           onPressed: () {
            //             accessibilitySettings.setTextColor(Colors.red);
            //           },
            //         ),
            //         IconButton(
            //           icon: const Icon(Icons.color_lens, color: Colors.green),
            //           onPressed: () {
            //             accessibilitySettings.setTextColor(Colors.green);
            //           },
            //         ),
            //         ColorPickerIconButton(
            //           key: UniqueKey(),
            //           title: "text",
            //           onPressed: (Color selectedColor, String text) {
            //             // Your onPressed callback logic here
            //             accessibilitySettings.setTextColor(selectedColor);
            //           },
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            // ListTile(
            //   title: const AccessibleHeadingText('Text BackgroundColor ',
            //       style: TextStyle(fontSize: 18.0)),
            //   trailing: SizedBox(
            //     width: 150.0,
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         IconButton(
            //           icon: const Icon(Icons.color_lens, color: Colors.red),
            //           onPressed: () {
            //             accessibilitySettings.setTextBgColor(Colors.red);
            //           },
            //         ),
            //         IconButton(
            //           icon: const Icon(Icons.color_lens, color: Colors.green),
            //           onPressed: () {
            //             accessibilitySettings.setTextBgColor(Colors.green);
            //           },
            //         ),
            //         ColorPickerIconButton(
            //           key: UniqueKey(),
            //           title: "textBackground",
            //           onPressed: (Color selectedColor, String textBackground) {
            //             // Your onPressed callback logic here
            //             accessibilitySettings.setTextBgColor(selectedColor);
            //           },
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            TextColorPicker(
              key: UniqueKey(),
              title: "Adjust Title Colors",
              onPressed: (Color selectedColor, String text) {
                // Your onPressed callback logic here
                accessibilitySettings.setHeadingColor(selectedColor);
              },
              onColorSelected: (Color color) {},
            ),
            TextColorPicker(
              key: UniqueKey(),
              title: "Adjust Text Colors",
              onPressed: (Color selectedColor, String text) {
                // Your onPressed callback logic here
                accessibilitySettings.setTextColor(selectedColor);
              },
              onColorSelected: (Color color) {},
            ),
            TextColorPicker(
              key: UniqueKey(),
              title: "Adjust Background Colors",
              onPressed: (Color selectedColor, String text) {
                // Your onPressed callback logic here
                accessibilitySettings.setTextBgColor(selectedColor);
              },
              onColorSelected: (Color color) {},
            ),

            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 250.0,
                child: ElevatedButton(
                    onPressed: () {
                      accessibilitySettings.reset();
                    },
                    child: const AccessibleText("Reset")),
              ),
            )
          ],
        ),
      ),
    );
  }
}





// ListTile(
            //   title: const AccessibleHeadingText('Font Size',
            //       style: TextStyle(fontSize: 17.0)),
            //   subtitle: const AccessibleText('Adjust font size',
            //       style: TextStyle(
            //         fontSize: 14.0,
            //       )),
            //   trailing: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       IconButton(
            //         icon: const Icon(Icons.remove),
            //         onPressed: () {
            //           accessibilitySettings.decreaseFontSize();
            //         },
            //       ),
            //       IconButton(
            //         icon: const Icon(Icons.add),
            //         onPressed: () {
            //           accessibilitySettings.increaseFontSize();
            //         },
            //       ),
            //     ],
            //   ),
            // ),

            // ListTile(
            //   title: const AccessibleHeadingText('Line Height ',
            //       style: TextStyle(fontSize: 17.0)),
            //   subtitle: const AccessibleText('Adjust line Height',
            //       style: TextStyle(
            //         fontSize: 14.0,
            //       )),
            //   trailing: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       IconButton(
            //         icon: const Icon(Icons.remove),
            //         onPressed: () {
            //           accessibilitySettings.decreaseLineHeight();
            //         },
            //       ),
            //       IconButton(
            //         icon: const Icon(Icons.add),
            //         onPressed: () {
            //           accessibilitySettings.increaseLineHeight();
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            // ListTile(
            //   title: const AccessibleHeadingText('Letter Space ',
            //       style: TextStyle(fontSize: 17.0)),
            //   subtitle: const AccessibleText(
            //     'Adjust letter Space',
            //     style: TextStyle(
            //       fontSize: 14.0,
            //     ),
            //   ),
            //   trailing: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       IconButton(
            //         icon: const Icon(Icons.remove),
            //         onPressed: () {
            //           accessibilitySettings.decreaseLetterSpace();
            //         },
            //       ),
            //       IconButton(
            //         icon: const Icon(Icons.add),
            //         onPressed: () {
            //           accessibilitySettings.increaseLetterSpace();
            //         },
            //       ),
            //     ],
            //   ),
            // ),
 // const SizedBox(
            //   height: 15,
            // ),
            // ListTile(
            //   title: const AccessibleHeadingText(' Scalfold BackgroundColor: ',
            //       style: TextStyle(fontSize: 15.0)),
            //   subtitle: const AccessibleText('Change  BackgroundColor',
            //       style: TextStyle(
            //         fontSize: 14.0,
            //       )),
            //   trailing: SizedBox(
            //     width: 150.0,
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         IconButton(
            //           icon: const Icon(Icons.color_lens, color: Colors.red),
            //           onPressed: () {
            //             accessibilitySettings.setScalfoldColor(Colors.red);
            //           },
            //         ),
            //         IconButton(
            //           icon: const Icon(Icons.color_lens, color: Colors.green),
            //           onPressed: () {
            //             accessibilitySettings.setScalfoldColor(Colors.green);
            //           },
            //         ),
            //         ColorPickerIconButton(
            //           key: UniqueKey(),
            //           title: "background",
            //           onPressed: (Color selectedColor, String background) {
            //             // Your onPressed callback logic here
            //             accessibilitySettings.setScalfoldColor(selectedColor);
            //           },
            //         )
            //       ],
            //     ),
            //   ),
            // ),
