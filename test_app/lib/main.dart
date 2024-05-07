import 'package:accessibility_features/accessibility_features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/new.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AccessibilityFeatures()..init(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          home: const MyWidget(),
        );
      },
    );
  }
}



// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   AccessibilityFeatures accessibilityFeatures = AccessibilityFeatures();

//   @override
//   Widget build(BuildContext context) {
//     final accessibilitySettings = context.watch<AccessibilityFeatures>();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Accessibility Features'),
//       ),
//       body: ListView(
//         children: [
//           ListTile(
//             title: AccessibleHeadingText(
//                 accessibilitySettings.colorBlindMode
//                     ? 'light mode'
//                     : 'Dark mode',
//                 style: const TextStyle(
//                     fontSize: 17.0,
//                     color: Colors.red,
//                     fontWeight: FontWeight.bold)),
//             trailing: Switch(
//               value: accessibilitySettings.isDark,
//               onChanged: accessibilitySettings.monochrome == MonochromeMode.off
//                   ? (value) {
//                       accessibilitySettings.changeTheme();
//                     }
//                   : null,
//             ),
//           ),

//           ListTile(
//             title: const AccessibleHeadingText(
//               "Monochrome",
//               style: TextStyle(fontSize: 17.0),
//             ),
//             trailing: Switch(
//               value: accessibilitySettings.monochrome == MonochromeMode.on,
//               onChanged: (value) {
//                 accessibilitySettings.toggleMonochrome();
//                 // _updateTheme(context);
//               },
//             ),
//           ),
//           ListTile(
//             title: const AccessibleHeadingText("Visually Impaired Mode",
//                 style: TextStyle(fontSize: 17.0)),
//             trailing: Switch(
//               value: accessibilitySettings.impairedMode,
//               onChanged: (value) {
//                 accessibilitySettings.toggleimpairedMode();
//                 // _updateTheme(context);
//               },
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           const AccessibilityImage(
//             image: AssetImage('assets/hello.png'),
//             width: 150,
//             height: 250,
//             fit: BoxFit.cover,
//             alignment: Alignment.center,
//             colorBlendMode: BlendMode.colorBurn,
//             filterQuality: FilterQuality.high,
//           ),

//           ListTile(
//             title: AccessibleHeadingText(
//                 accessibilitySettings.imageVisibility
//                     ? 'Hide Image'
//                     : 'Show Image',
//                 style: const TextStyle(fontSize: 17.0)),
//             trailing: Switch(
//               value: !accessibilitySettings.imageVisibility,
//               onChanged: (value) {
//                 accessibilitySettings.hideImage();
//                 // _updateTheme(context);
//               },
//             ),
//           ),

//           ListTile(
//             title: const AccessibleHeadingText('Font Size: ',
//                 style: TextStyle(fontSize: 17.0)),
//             subtitle: const AccessibleText('Adjust font size',
//                 style: TextStyle(
//                   fontSize: 14.0,
//                 )),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.remove),
//                   onPressed: () {
//                     accessibilitySettings.decreaseFontSize();
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.add),
//                   onPressed: () {
//                     accessibilitySettings.increaseFontSize();
//                   },
//                 ),
//               ],
//             ),
//           ),

//           ListTile(
//             title: const AccessibleHeadingText('Line Height: ',
//                 style: TextStyle(fontSize: 17.0)),
//             subtitle: const AccessibleText('Adjust line Height',
//                 style: TextStyle(
//                   fontSize: 14.0,
//                 )),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.remove),
//                   onPressed: () {
//                     accessibilitySettings.decreaseLineHeight();
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.add),
//                   onPressed: () {
//                     accessibilitySettings.increaseFontSize();
//                   },
//                 ),
//               ],
//             ),
//           ),
//           ListTile(
//             title: const AccessibleHeadingText('Letter Space: ',
//                 style: TextStyle(fontSize: 17.0)),
//             subtitle: const AccessibleText(
//               'Adjust letter Space',
//               style: TextStyle(
//                 fontSize: 14.0,
//                 color: Colors.red,
//               ),
//             ),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.remove),
//                   onPressed: () {
//                     accessibilitySettings.decreaseLetterSpace();
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.add),
//                   onPressed: () {
//                     accessibilitySettings.increaseLetterSpace();
//                   },
//                 ),
//               ],
//             ),
//           ),

//           // color change
//           ListTile(
//             title: const AccessibleHeadingText('Heading Color: ',
//                 style: TextStyle(fontSize: 17.0)),
//             subtitle: const AccessibleText('Change heading color',
//                 style: TextStyle(
//                   fontSize: 14.0,
//                 )),
//             trailing: SizedBox(
//               width: 150.0,
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: const Icon(
//                       Icons.color_lens,
//                       color: Colors.red,
//                     ),
//                     onPressed: () {
//                       accessibilitySettings.setHeadingColor(Colors.red);
//                     },
//                   ),
//                   IconButton(
//                     icon: const Icon(
//                       Icons.color_lens,
//                       color: Colors.green,
//                     ),
//                     onPressed: () {
//                       accessibilitySettings.setHeadingColor(Colors.green);
//                     },
//                   ),
//                   ColorPickerIconButton(
//                     key: UniqueKey(),
//                     title: "heading",
//                     onPressed: (Color selectedColor, String heading) {
//                       // Your onPressed callback logic here
//                       accessibilitySettings.setHeadingColor(selectedColor);
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ),
//           ListTile(
//             title: const AccessibleHeadingText('Text Color: ',
//                 style: TextStyle(fontSize: 17.0)),
//             subtitle: const AccessibleText('Change Text color',
//                 style: TextStyle(
//                   fontSize: 14.0,
//                 )),
//             trailing: SizedBox(
//               width: 150.0,
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.color_lens, color: Colors.red),
//                     onPressed: () {
//                       accessibilitySettings.setTextColor(Colors.red);
//                     },
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.color_lens, color: Colors.green),
//                     onPressed: () {
//                       accessibilitySettings.setTextColor(Colors.green);
//                     },
//                   ),
//                   ColorPickerIconButton(
//                     key: UniqueKey(),
//                     title: "text",
//                     onPressed: (Color selectedColor, String text) {
//                       // Your onPressed callback logic here
//                       accessibilitySettings.setTextColor(selectedColor);
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           ListTile(
//             title: const AccessibleHeadingText('Text BackgroundColor: ',
//                 style: TextStyle(fontSize: 18.0)),
//             subtitle: const AccessibleText('Change Text BackgroundColor',
//                 style: TextStyle(
//                   fontSize: 14.0,
//                 )),
//             trailing: SizedBox(
//               width: 150.0,
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.color_lens, color: Colors.red),
//                     onPressed: () {
//                       accessibilitySettings.setTextBgColor(Colors.red);
//                     },
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.color_lens, color: Colors.green),
//                     onPressed: () {
//                       accessibilitySettings.setTextBgColor(Colors.green);
//                     },
//                   ),
//                   ColorPickerIconButton(
//                     key: UniqueKey(),
//                     title: "textBackground",
//                     onPressed: (Color selectedColor, String textBackground) {
//                       // Your onPressed callback logic here
//                       accessibilitySettings.setTextBgColor(selectedColor);
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           ListTile(
//             title: const AccessibleHeadingText(' Scalfold BackgroundColor: ',
//                 style: TextStyle(fontSize: 15.0)),
//             subtitle: const AccessibleText('Change  BackgroundColor',
//                 style: TextStyle(
//                   fontSize: 14.0,
//                 )),
//             trailing: SizedBox(
//               width: 150.0,
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.color_lens, color: Colors.red),
//                     onPressed: () {
//                       accessibilitySettings.setScalfoldColor(Colors.red);
//                     },
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.color_lens, color: Colors.green),
//                     onPressed: () {
//                       const AccessibilityScreen();
//                     },
//                   ),
//                   ColorPickerIconButton(
//                     key: UniqueKey(),
//                     title: "background",
//                     onPressed: (Color selectedColor, String background) {
//                       // Your onPressed callback logic here
//                       accessibilitySettings.setScalfoldColor(selectedColor);
//                     },
//                   )
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   accessibilitySettings.setTextAlignment(TextAlign.left);
//                 },
//                 child: const Column(
//                   children: [
//                     Icon(Icons.align_horizontal_left),
//                     Text("Left Align")
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   accessibilitySettings.setTextAlignment(TextAlign.center);
//                 },
//                 child: const Column(
//                   children: [
//                     Icon(Icons.align_horizontal_center),
//                     Text("center Align")
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   accessibilitySettings.setTextAlignment(TextAlign.right);
//                 },
//                 child: const Column(
//                   children: [
//                     Icon(Icons.align_horizontal_right),
//                     Text("Right Align")
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         const AccessibilityScreen(), // Replace YourNextScreen with the screen you want to navigate to
//                   ),
//                 );
//               },
//               child: const Center(
//                   child: Text(
//                 "NEXT PAGE",
//                 style: TextStyle(color: Colors.amber),
//               ))),
//           const SizedBox(
//             height: 15,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 accessibilitySettings.reset();
//               },
//               child: const AccessibleText("Reset"))
//         ],
//       ),
//     );
//   }
// }
