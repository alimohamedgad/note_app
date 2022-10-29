import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.color = Colors.black,
      this.hintStyleColor = Colors.grey,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Color color;
  final Color hintStyleColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: hintStyleColor
        )
      ),
      style:
          TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: color),
    );
  }
}

class MultiTextField extends StatelessWidget {
  const MultiTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.hintStyleColor = Colors.grey,
    this.color = Colors.red,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final Color color;
  final Color hintStyleColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: hintStyleColor,
        ),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Colors.red, width: 2));
  }
}
