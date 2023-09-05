import 'package:e_commerce/view/widget/text_utils.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Color color;
  final String text;
  final double width;
  final double height;
  final Function() function;

   AuthButton({
    required this.color,
    required this.text,
    required this.width,
    required this.height,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              00.0,
            ),
          ),
        ),
        onPressed: function,
        child: TextUtils(
          text: text,
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 17.0,
        ),
      ),
    );
  }
}
