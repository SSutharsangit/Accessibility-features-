import 'package:flutter/material.dart';

class TextColorPicker extends StatefulWidget {
  final void Function(Color color) onColorSelected;
  final Function(Color, String) onPressed;
  final String title;

  const TextColorPicker(
      {super.key,
      required this.onColorSelected,
      required this.onPressed,
      required this.title});

  @override
  _TextColorPickerState createState() => _TextColorPickerState();
}

class _TextColorPickerState extends State<TextColorPicker> {
  final List<Color> colors = [
    Colors.grey,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.amber,
    Colors.green,
    Colors.purple,
    Colors.pink,
    Colors.lime,
    Colors.teal,
    Colors.cyan,
    Colors.blue,
    Colors.indigo,
    Colors.black,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          GridView.count(
            crossAxisCount: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(colors.length, (index) {
              final color = colors[index];
              return InkWell(
                  onTap: () {
                    widget.onColorSelected(color);
                    widget.onPressed(color, widget.title);
                  },
                  child: Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ));
            }),
          ),
        ],
      ),
    );
  }
}
