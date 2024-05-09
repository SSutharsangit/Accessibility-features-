# Accessibility Features

## Overview
The Accessibility Features app allows users to customize their experience based on their accessibility needs. It provides options to adjust font size, line height, letter spacing, text colors, background colors, alignment, and more.
**Checkers and tools to ensure your app is accessible to all.**

Creating an accessible app is incredibly important. But too often it's forgotten about, or left to later. This package ensures your app is accessible from day one, by checking your interface as you build it.

## Features
    Accessibility Modes:
    Dark mode
    System default mode
    Monochrome
    Visually Impaired Mode
    Cognitive Disability mode
    Image visibility control
    Readable Experience:
    Font size adjustment
    Line height adjustment
    Letter spacing adjustment
    Text alignment options
    Visually Pleasing Experience:
    Adjust title colors
    Adjust text colors
    Adjust background colors
    Reset Functionality:
    Reset all settings to default
## Getting Started

Add `AccessibilityFeatures` to your app's `Consumer` property:

```dart
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
}
```
## Current accessibility checkers

To get the Accessibility Controll:

```dart
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
```

### widget in Accessiblity-features

Makes sure Text  (`AccessibleHeadingText`, `AccessibleText`,) and Images (`AccessibilityImage`) have semantic labels.

## Configuration

Checkers are enabled or disabled with properties on the `Accessibility` widget:

```dart
 AccessibleHeadingText(
   "Hello This is Accessibility...",
    style: TextStyle(fontSize: 30),
),
```
```dart
AccessibleText(
   "This is a simple text widget",
   style: TextStyle(fontSize: 20),
   ),
```
```dart
AccessibilityImage(
   image: AssetImage('assets/hello.png'),
   width: 200,
   height: 250,
   fit: BoxFit.cover,
   alignment: Alignment.center,
   colorBlendMode: BlendMode.colorBurn,
   filterQuality: FilterQuality.high,
  ),
```

[rebel_home]: https://rebelappstudio.com/
