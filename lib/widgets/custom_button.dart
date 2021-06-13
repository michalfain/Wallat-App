import 'package:flutter/material.dart';
import 'package:wallet_app/widgets/text_wigdet.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.function, required this.text});
  final Function function;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.redAccent,
      ),
      onPressed: () {
        function();
      },
      child: TextWidget(
        color: Colors.black54,
        text: text,
      ),
    );
  }
}
