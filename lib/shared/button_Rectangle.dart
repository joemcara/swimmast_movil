import 'package:flutter/material.dart';
import 'constants.dart';

class CustomButtonRectangle extends StatelessWidget {
  const CustomButtonRectangle(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.icon,
      required this.colorBackground});
  final String text;
  final Function onPressed;
  final IconData icon;
  final Color colorBackground;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorBackground,
          textStyle:
              TextStyle(color: Colors.white), // Color del texto y el ícono
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Bordes rectangulares
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: swimmastBlue,
              child: Icon(icon, color: Colors.white),
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
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
