import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.w500),
    );
  }
}
