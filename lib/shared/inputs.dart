import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({super.key, required this.hintText, this.label, this.signIn, required this.controller});
  final String hintText;
  final String? label;
  final bool? signIn;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.33)),
      border: InputBorder.none,
    );

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(signIn != null && signIn! ? 50 : 10),
            border: Border.all(color: Colors.black),
            color: Colors.white),
        child: Column(
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(fontSize: 16, letterSpacing: 2),
              decoration: inputDecoration,
              enableSuggestions: true,
              autocorrect: true,
            ),
          ],
        ));
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key, required this.hintText, this.label, this.signIn, required this.controller});
  final String hintText;
  final String? label;
  final bool? signIn;

  final TextEditingController controller;


  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var inputDecoration = InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.33)),
        border: InputBorder.none,
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon:
                Icon(_obscureText ? Icons.visibility_off : Icons.visibility)));

    return Container(
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                widget.signIn != null && widget.signIn! ? 50 : 10),
            border: Border.all(color: Colors.black),
            color: Colors.white),
        child: Column(
          children: [
            TextField(
              controller: widget.controller,
              style: const TextStyle(fontSize: 16, letterSpacing: 2),
              decoration: inputDecoration,
              obscureText: _obscureText,
              enableSuggestions: false,
              autocorrect: false,
            ),
          ],
        ));
  }
}


