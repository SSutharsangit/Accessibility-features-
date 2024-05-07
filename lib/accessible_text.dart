import 'package:accessibility_features/accessibility_features.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccessibleText extends StatelessWidget {
  final String data;
  final TextStyle? style;

  const AccessibleText(this.data, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    final accessibilitySettings = context.watch<AccessibilityFeatures>();

    final Color? textColor = style?.color;
    final Color? fallbackColor =
        accessibilitySettings.stringToColor(accessibilitySettings.textColor);

    final bool isBlackOrWhite =
        textColor == Colors.black || textColor == Colors.white;

    final Color? finalColor =
        isBlackOrWhite ? fallbackColor : textColor ?? fallbackColor;

    return Text(
      data,
      textAlign: accessibilitySettings.textAlignment,
      style: (style ?? const TextStyle()).copyWith(
        fontWeight: style?.fontWeight ??
            (accessibilitySettings.impairedMode
                ? FontWeight.bold
                : FontWeight.normal),
        backgroundColor:
            style?.backgroundColor ?? accessibilitySettings.textBgColor,
        fontSize: ((style?.fontSize ?? 0) *
                accessibilitySettings.textScaleFactor *
                (accessibilitySettings.impairedMode ? 1.2 : 1)),
        color: finalColor,
        height: accessibilitySettings.lineHeight,
        letterSpacing: accessibilitySettings.letterSpacing,
      ),
    );
  }
}
