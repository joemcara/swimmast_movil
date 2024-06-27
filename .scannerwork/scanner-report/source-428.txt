import 'package:flutter/material.dart';

// class LoginInput extends StatefulWidget {
//   final String placeholder
//   @override
//   State<LoginInput> createState()=> _LoginInputState();
// }

//class _LoginInputState extends State<LoginInput>{
class LoginInput extends StatelessWidget {
  const LoginInput({super.key, required this.placeholder});
  final String placeholder;
  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      hintText: placeholder,
      hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.33)),
      border: InputBorder.none,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black),
          color: Colors.white),
      child: TextField(
        style: const TextStyle(fontSize: 20, letterSpacing: 2),
        textAlign: TextAlign.center,
        decoration: inputDecoration,
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }
}
