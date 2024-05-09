import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme { light, dark, highContrast }

// enum MonochromeMode { off, on }

class AccessibilityFeatures extends ChangeNotifier {
  // AppTheme _currentTheme = AppTheme.light;
  double _currentFontSize = 16.0;
  bool _colorBlindMode = false;
  bool _impairedMode = false;
  bool _cognitiveMode = false;
  bool _adhd = false;
  double _textScaleFactor = 1.0;
  String? _headingColor; // Default heading color as string
  String? _textColor; // Default text color
  Color? _textBgColor; // Default text background color
  Color _scaldBgColor = Colors.white; // Default scaffold background color
  double _lineHeight = 1.0; // Default line height
  double _letterSpacing = 1.0;
  Color? _imageColor = Colors.white;
  bool _imageVisibility = true;
  TextAlign _textAlignment = TextAlign.left;
  bool _monochrome = false;
  bool _systemMode = false;
  bool _isDark = false;
  String? _originalTextColor;
  String? _originalHeadingColor;
  String? _originalImageColor;
  SharedPreferences? storage;

  // Getter methods for accessing properties
  // AppTheme get currentTheme => _currentTheme;
  double get currentFontSize => _currentFontSize;
  bool get colorBlindMode => _colorBlindMode;
  bool get impairedMode => _impairedMode;
  bool get adhd => _adhd;
  bool get cognitiveMode => _cognitiveMode;
  bool get monochrome => _monochrome;
  double get textScaleFactor => _textScaleFactor;
  String? get headingColor => _headingColor;
  String? get textColor => _textColor;
  Color? get textBgColor => _textBgColor;
  Color get scaldBgColor => _scaldBgColor;
  double get lineHeight => _lineHeight;
  double get letterSpacing => _letterSpacing;
  Color? get imageColor => _imageColor;
  bool get imageVisibility => _imageVisibility;
  TextAlign get textAlignment => _textAlignment;
  bool get systemMode => _systemMode;
  bool get isDark => _isDark;
  String? get originalTextColor => _originalTextColor;
  String? get originalHeadingColor => _originalHeadingColor;
  String? get orginalImageColor => _originalImageColor;

  // Constructor to initialize the theme
  AccessibilityFeatures() {
    // _currentTheme = AppTheme.light;
    _currentFontSize = 16.0;
    // _colorBlindMode = false;
    _textScaleFactor = 1.0;
    _originalImageColor = Colors.white.value.toString();
  }

  final darkTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
    ),
  );

  final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    primaryColorDark: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
    ),
  );

  changeTheme() {
    _isDark = !isDark;
    storage?.setBool("isDark", _isDark);
    _imageColor = Colors.white;
    notifyListeners();
  }

  //Init method of provider
  init() async {
    // After we re run the appS
    storage = await SharedPreferences.getInstance();
    _isDark = storage?.getBool("isDark") ?? false;
    _systemMode = storage?.getBool("isSystem") ?? false;
    _imageVisibility = storage?.getBool("imageVisibility") ?? true;
    _headingColor = storage?.getString("headingColor");
    _textColor = storage?.getString("textColor");
    _impairedMode = storage?.getBool("impairedMode") ?? false;
    _adhd = storage?.getBool("adhd") ?? false;
    _cognitiveMode = storage?.getBool("cognitiveMode") ?? false;
    _lineHeight = 1.0; // Use a default value
    _letterSpacing = storage!.getDouble("letterSpacing") ?? 1.0;
    _lineHeight = storage!.getDouble("lineHeight") ?? 1.0;
    _currentFontSize = storage!.getDouble("currentFontSize") ?? 16.0;
    _monochrome = storage?.getBool("monochrome") ?? false;

    // final db = await AccessibilityDatasource.getDB();
    // final settings = await AccessibilityDatasource.getAllAccessibility();
    // if (settings != null && settings.isNotEmpty) {
    //   final accessibilityModel = settings.first;
    //   _currentFontSize = accessibilityModel.currentFontSize ?? 16.0;
    //   _colorBlindMode = accessibilityModel.colorBlindMode ?? false;
    //   _textScaleFactor = accessibilityModel.textScaleFactor ?? 1.0;
    //   // _monochrome = accessibilityModel.monochrome ?? MonochromeMode.off;
    //   _originalTextColor = accessibilityModel.originalTextColor;
    //   _originalHeadingColor = accessibilityModel.originalHeadingColor;
    //   _originalImageColor = accessibilityModel.originalImageColor;
    // }

    notifyListeners();
  }

  Color? stringToColor(String? colorString) {
    if (colorString == null || colorString.isEmpty) {
      return null;
    }
    return Color(int.parse(colorString));
  }

  String? colorToString(Color? color) {
    if (color == null) {
      return null;
    }
    return color.value.toString();
  }

  ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
  );
  ThemeData darkMode = ThemeData(brightness: Brightness.dark);

  // Method to increase font size
  void increaseFontSize() {
    if (_currentFontSize <= 26) {
      _currentFontSize += 2.0;

      updateTextScaleFactor();
    }
  }

  // Method to decrease font size
  void decreaseFontSize() {
    if (_currentFontSize >= 11) {
      _currentFontSize -= 2.0;
      updateTextScaleFactor();
    }
  }

  // Method to toggle impaired mode
  void toggleimpairedMode() {
    _impairedMode = !_impairedMode;
    storage!.setBool("impairedMode", _impairedMode);
    notifyListeners(); // Notify listeners to update UI
  }

  void togglecognitiveModeMode() {
    _cognitiveMode = !_cognitiveMode;
    storage!.setBool("cognitiveMode", _cognitiveMode);
    notifyListeners(); // Notify listeners to update UI
  }

  // Method to toggle impaired mode
  void toggleADHDMode() {
    _adhd = !_adhd;
    storage!.setBool("adhd", _adhd);
    notifyListeners(); // Notify listeners to update UI
  }

  void toggleMonochrome() {
    _monochrome = !_monochrome;

    if (_monochrome) {
      // Store original colors before switching to monochrome mode
      _originalTextColor = _textColor;
      _originalHeadingColor = _headingColor;
      _originalImageColor = colorToString(_imageColor);

      // Set colors to grey when monochrome mode is on
      _textColor = Colors.grey.value.toString();
      _headingColor = Colors.grey.value.toString();
      _imageColor = Colors.grey;
      if (_headingColor != null) {
        storage!.setString("headingColor", _headingColor!);
      }
      if (_textColor != null) {
        storage!.setString("textColor", _textColor!);
      }
    } else {
      // Restore original colors when turning off monochrome mode
      _textColor = _originalTextColor;
      _headingColor = _originalHeadingColor;
      _imageColor = stringToColor(_originalImageColor);
      if (_headingColor != null) {
        storage!.setString("headingColor", _headingColor!);
      }
      if (_textColor != null) {
        storage!.setString("textColor", _textColor!);
      }
    }

    storage?.setBool("monochrome", _monochrome);

    notifyListeners();
  }

  void toggleSystem() {
    _systemMode = !_systemMode; // Toggle system mode
    if (_systemMode) {
      // If system mode is on, adjust theme mode based on system brightness
      // final Brightness brightness =
      PlatformDispatcher.instance.platformBrightness;
    }
    storage?.setBool("isSystem", _systemMode);
    notifyListeners();
  }

  // Method to adjust text size
  void adjustTextSize(double newTextScaleFactor) {
    _textScaleFactor = newTextScaleFactor;

    notifyListeners(); // Notify listeners to update UI
  }

  // Method to update text scale factor
  void updateTextScaleFactor() {
    // Calculate text scale factor based on current font size
    _textScaleFactor =
        _currentFontSize / 16.0; // Assuming 16.0 is the base font size
    storage?.setDouble("currentFontSize", _currentFontSize);
    notifyListeners(); // Notify listeners to update UI
  }

  void hideImage() {
    // Calculate text scale factor based on current font size
    _imageVisibility = !_imageVisibility; // Assuming 16.0 is the base font size
    storage?.setBool("imageVisibility", _imageVisibility);
    notifyListeners(); // Notify listeners to update UI
  }

  // Method to set heading color
  void setHeadingColor(Color color) {
    _headingColor = color.value.toString(); // Convert Color to string
    if (_headingColor != null) {
      storage!.setString("headingColor", _headingColor!);
    } else {
      // Handle the case where _headingColor or storage is null
      // For example, you could assign a default value or handle the error
    }
    notifyListeners();
  }

  // Method to set text color
  void setTextAlignment(TextAlign align) {
    _textAlignment = align;
    notifyListeners();
  }

  // Method to set text color
  void setTextColor(Color color) {
    _textColor = color.value.toString(); // Convert Color to string
    if (_textColor != null) {
      storage!.setString("textColor", _textColor!);
    } else {
      // Handle the case where _headingColor or storage is null
      // For example, you could assign a default value or handle the error
    }
    notifyListeners();
  }

  // Method to set text background color
  void setTextBgColor(Color color) {
    _textBgColor = color;

    notifyListeners();
  }

  // Method to set scaffold background color
  void setScalfoldColor(Color color) {
    _scaldBgColor = color;
    notifyListeners();
  }

  void increaseLineHeight() async {
    if (_lineHeight <= 3.0) {
      _lineHeight += 0.1;
      storage?.setDouble("lineHeight", _lineHeight);

      notifyListeners();
    }
  }

  void decreaseLineHeight() async {
    if (_lineHeight > 0.5) {
      _lineHeight -= 0.1;
      storage?.setDouble("lineHeight", _lineHeight);

      notifyListeners();
    }
  }

  void increaseLetterSpace() {
    if (_letterSpacing <= 3.0) {
      _letterSpacing += 0.1;
      storage!.setDouble("letterSpacing", _letterSpacing);
      notifyListeners();
    }
  }

  void decreaseLetterSpace() {
    if (_letterSpacing > 0.1) {
      _letterSpacing -= 0.1;
      storage!.setDouble("letterSpacing", _letterSpacing);
      notifyListeners();
    }
  }

  // Method to reset all settings
  void reset() {
    // _currentTheme = AppTheme.light;
    _impairedMode = false;
    _adhd = false;
    _cognitiveMode = false;
    _monochrome = false;
    _currentFontSize = 16.0;
    _colorBlindMode = false;
    _textScaleFactor = 1.0;
    _textBgColor = null;
    _scaldBgColor = Colors.white;
    _imageColor = Colors.white;
    _lineHeight = 1.0;
    _letterSpacing = 1.0;
    _imageVisibility = true;
    _textAlignment = TextAlign.left;
    _isDark = false;
    _systemMode = false;
    _headingColor = null;
    _textColor = null;
    storage!.setBool("impairedMode", _impairedMode);
    storage!.setBool("adhd", _adhd);
    storage!.setBool("cognitiveMode", _cognitiveMode);
    storage?.setBool("isDark", _isDark);
    storage?.setBool("isSystem", _systemMode);
    storage?.setBool("imageVisibility", _imageVisibility);
    storage?.setString("headingColor", _headingColor ?? "");
    storage?.setString("textColor", _textColor ?? "");
    storage?.setDouble("lineHeight", _lineHeight);
    storage!.setDouble("letterSpacing", _letterSpacing);
    storage?.setBool("monochrome", _monochrome);
    notifyListeners();
  }
}
