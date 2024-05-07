import 'package:accessibility_features/accessibility_features.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () {
    final accessibilityFeatures = AccessibilityFeatures();

    expect(accessibilityFeatures.colorBlindMode, false);
    expect(accessibilityFeatures.textScaleFactor, 1.0);
  });
}
