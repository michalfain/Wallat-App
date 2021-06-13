import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  CustomField({required this.controller, required this.text});
  final TextEditingController controller;
  final String text;

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(hintText: widget.text),
    );
  }
}
