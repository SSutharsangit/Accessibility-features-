import 'package:flutter/material.dart';

enum MonochromeMode { off, on }

class AccessibilityModel {
  final int id;
  double currentFontSize;
  bool colorBlindMode;
  bool impairedMode;
  double textScaleFactor;
  String? headingColor;
  String? textColor;
  Color textBgColor;
  Color scaldBgColor;
  double lineHeight;
  double letterSpacing;
  Color? imageColor;
  bool imageVisibility;
  TextAlign textAlignment;
  MonochromeMode? monochrome;
  bool systemMode;
  bool isDark;
  String? originalTextColor;
  String? originalHeadingColor;
  String? originalImageColor;

  AccessibilityModel({
    required this.id,
    required this.currentFontSize,
    required this.colorBlindMode,
    required this.impairedMode,
    required this.textScaleFactor,
    required this.headingColor,
    required this.textColor,
    required this.textBgColor,
    required this.scaldBgColor,
    required this.lineHeight,
    required this.letterSpacing,
    required this.imageColor,
    required this.imageVisibility,
    required this.textAlignment,
    this.monochrome,
    required this.systemMode,
    required this.isDark,
    required this.originalTextColor,
    required this.originalHeadingColor,
    required this.originalImageColor,
  });

  factory AccessibilityModel.fromJson(Map<String, dynamic> json) {
    return AccessibilityModel(
      id: json['id'],
      currentFontSize: json['currentFontSize'],
      colorBlindMode: json['colorBlindMode'],
      impairedMode: json['impairedMode'],
      textScaleFactor: json['textScaleFactor'],
      headingColor: json['headingColor'],
      textColor: json['textColor'],
      textBgColor: json['textBgColor'] ?? Colors.transparent,
      scaldBgColor: json['scaldBgColor'] ?? Colors.white,
      lineHeight: json['lineHeight'] ?? 1.0,
      letterSpacing: json['letterSpacing'] ?? 1.0,
      imageColor: json['imageColor'],
      imageVisibility: json['imageVisibility'],
      textAlignment: json['textAlignment'] ?? TextAlign.left,
      monochrome: MonochromeMode.values[json['monochrome']],
      systemMode: json['systemMode'],
      isDark: json['isDark'],
      originalTextColor: json['originalTextColor'],
      originalHeadingColor: json['originalHeadingColor'],
      originalImageColor: json['originalImageColor'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'currentFontSize': currentFontSize,
      'colorBlindMode': colorBlindMode,
      'impairedMode': impairedMode,
      'textScaleFactor': textScaleFactor,
      'headingColor': headingColor,
      'textColor': textColor,
      'textBgColor': textBgColor,
      'scaldBgColor': scaldBgColor,
      'lineHeight': lineHeight,
      'letterSpacing': letterSpacing,
      'imageColor': imageColor,
      'imageVisibility': imageVisibility,
      'textAlignment': textAlignment.index, // assuming TextAlign is an enum
      'monochrome': monochrome?.index, // assuming MonochromeMode is an enum
      'systemMode': systemMode,
      'isDark': isDark,
      'originalTextColor': originalTextColor,
      'originalHeadingColor': originalHeadingColor,
      'originalImageColor': originalImageColor,
    };
  }
}
