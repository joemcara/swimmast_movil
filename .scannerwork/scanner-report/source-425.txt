import 'package:flutter/material.dart';

class CustomableIcon extends StatefulWidget {
  final IconData icon1;
  final IconData icon2;

  const CustomableIcon({
    super.key,
    required this.icon1,
    required this.icon2,
  });

  @override
  CustomableIconState createState() => CustomableIconState();
}

class CustomableIconState extends State<CustomableIcon> {
  bool _isFirstIcon = true;

  void _toggleIcon() {
    setState(() {
      _isFirstIcon = !_isFirstIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleIcon,
      child: Icon(
        _isFirstIcon ? widget.icon1 : widget.icon2,
      ),
    );
  }
}
