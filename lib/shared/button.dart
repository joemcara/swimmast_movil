import 'package:flutter/material.dart';
import 'constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: FilledButton.styleFrom(backgroundColor: system_yellow),
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: TextStyle(
              letterSpacing: 3,
              color: system_blue,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ));
  }
}
