import 'package:accessibility_features/accessibility_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class ColorPickerIconButton extends StatefulWidget {
  final Function(Color, String) onPressed;
  final String title;

  const ColorPickerIconButton({
    required Key key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  _ColorPickerIconButtonState createState() => _ColorPickerIconButtonState();
}

class _ColorPickerIconButtonState extends State<ColorPickerIconButton> {
  Color selectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    context.watch<AccessibilityFeatures>();
    return IconButton(
      icon: const Icon(Icons.color_lens, color: Colors.blue),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title:
                  Text('Pick a color for ${widget.title}'), // Use widget.title
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: selectedColor,
                  onColorChanged: (color) {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                  pickerAreaHeightPercent: 0.8,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Call onPressed callback with selectedColor and title
                    widget.onPressed(selectedColor, widget.title);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
