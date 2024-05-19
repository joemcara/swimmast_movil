import 'package:flutter/material.dart';

class SwimmastIconText extends StatelessWidget {
  final String text;
  final Icon icon;
  const SwimmastIconText({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
