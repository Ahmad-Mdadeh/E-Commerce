import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final bool outerBorder;
  final Color color;

  const ColorPicker({
    required this.color,
    required this.outerBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: outerBorder
            ? Border.all(
                color: color,
                width: 2.0,
              )
            : null,
      ),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
