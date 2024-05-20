import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/memberScreens/bottomNav/main_screen_member.dart';
import 'package:swimmast_movil/screens/sign_up_screen.dart';
import 'package:swimmast_movil/screens/sportPerson/bottonNav/main_screen_sport.dart';
import 'package:swimmast_movil/screens/trainerScreens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/shared/button.dart';
import 'package:swimmast_movil/shared/inputs.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var member = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(top: statusBarHeight),
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
                        SizedBox(
                          height: 25,
                        ),
                        TextInput(
                          hintText: "Ingrese su correo",
                          signIn: true,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        PasswordInput(
                          hintText: "Contraseña",
                          signIn: true,
                        ),
                      ],
                    )),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      text: "Crear cuenta",
                      text_color: Colors.white,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      width: size.width,
                      height: 50,
                      child: FilledButton(
                          onPressed: () {
                            if (member) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainScreenMember()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainScreenMember()));
                            }
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
