import 'package:flutter/material.dart';

// class LoginInput extends StatefulWidget {
//   final String placeholder
//   @override
//   State<LoginInput> createState()=> _LoginInputState();
// }

//class _LoginInputState extends State<LoginInput>{
class SignInInput extends StatelessWidget {
  const SignInInput(
      {super.key, required this.hintText, this.label, this.password});
  final String hintText;
  final String? label;
  final bool? password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final inputDecoration = InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.33)),
      border: InputBorder.none,
    );

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            label ?? " ",
            textAlign: TextAlign.start,
          ),
          width: size.width,
          height: 25,
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.black),
                color: Colors.white),
            child: Column(
              children: [
                TextField(
                  style: const TextStyle(fontSize: 20, letterSpacing: 2),
                  textAlign: TextAlign.center,
                  decoration: inputDecoration,
                  obscureText: password ?? false,
                  enableSuggestions:
                      password != null && password! ? false : true,
                  autocorrect: password != null && password! ? false : true,
                ),
              ],
            ))
      ],
    );
  }
}

class SignUpInput extends StatelessWidget {
  const SignUpInput(
      {super.key, required this.hintText, this.label, this.password});
  final String hintText;
  final String? label;
  final bool? password;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final inputDecoration = InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.33)),
      border: InputBorder.none,
    );

    return Column(
      children: [
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Text(
            label ?? "label",
            textAlign: TextAlign.start,
          ),
          width: size.width,
          height: 25,
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.black),
                color: Colors.white),
            child: Column(
              children: [
                TextField(
                  style: const TextStyle(fontSize: 15, letterSpacing: 2),
                  // textAlign: TextAlign.center,
                  decoration: inputDecoration,
                  obscureText: password ?? false,
                  enableSuggestions:
                      password != null && password! ? false : true,
                  autocorrect: password != null && password! ? false : true,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.password))
              ],
            ))
      ],
    );
  }
}
