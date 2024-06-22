import 'package:flutter/material.dart';
import 'constants.dart';

class CustomButtonRectangle extends StatelessWidget {
  const CustomButtonRectangle(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.icon});
  final String text;
  final Function onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: FilledButton.styleFrom(backgroundColor: Colors.white),
        onPressed: () {
          onPressed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              backgroundColor: swimmastBlue,
              child: Icon(Icons.group, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            )
          ],
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
          textStyle: const TextStyle(fontSize: 16, letterSpacing: 2)),
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
