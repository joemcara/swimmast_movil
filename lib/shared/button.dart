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
          style: const TextStyle(
              letterSpacing: 3,
              color: system_blue,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ));
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.text_color});
  final String text;
  final Function onPressed;
  final text_color;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: TextButton.styleFrom(
          textStyle: const TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 16,
              letterSpacing: 2)),
      child: Text(
        text,
        style: TextStyle(color: text_color),
      ),
    );
  }
}
