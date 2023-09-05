import 'package:e_commerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;
  final Function validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool filled;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;

  AuthTextFromField({
    required this.validator,
    required this.controller,
    required this.textInputType,
    required this.obscureText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.filled,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: Colors.black,
        fontSize: 17.0,
      ),
      cursorColor: Get.isDarkMode ? pinkClr : mainColor,
      keyboardType: textInputType,
      obscureText: obscureText,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 18.0,
            right: 20.0,
          ),
          child: CircleAvatar(
            child: prefixIcon,
            backgroundColor: Colors.white,
          ),
        ),
        suffixIcon: suffixIcon,
        fillColor: Colors.grey.shade200,
        filled: filled,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black54,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }
}
