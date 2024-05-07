import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swimmast_movil/screens/sign_up_screen.dart';
import 'package:swimmast_movil/shared/bottom_nav_bar.dart';
import 'package:swimmast_movil/shared/inputs.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          height: size.height,
          color: const Color.fromRGBO(11, 34, 181, 1),
          child: Column(
            children: [
              SizedBox(
                height: size.height * .45,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        "lib/assets/swim.png",
                        height: size.height * .40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        "lib/assets/swimmast_logo.png",
                        height: 100,
                        width: 100,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      "SWIMMAST",
                      style: TextStyle(
                          fontSize: 30, color: Colors.white, letterSpacing: 2),
                    ),
                    const Form(
                        child: Column(
                      children: [
                        SignInInput(
                          hintText: "Ingrese su correo",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SignInInput(
                          hintText: "Contraseña",
                          password: true,
                        ),
                      ],
                    )),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              letterSpacing: 2)),
                      child: const Text(
                        "Crear cuenta",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      width: size.width,
                      height: 50,
                      child: FilledButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MyBottomNavBar()));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(244, 232, 105, 1)),
                          ),
                          child: const Text(
                            "Ingresar",
                            style: TextStyle(
                                letterSpacing: 2,
                                color: Color.fromRGBO(11, 34, 181, 1),
                                fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
            ],
          )),
    ));
  }
}
