import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/login_input.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      color: Color.fromRGBO(11, 34, 181, 1),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: size.height * .25,
            ),
            Form(
                child: Column(
              children: [
                LoginInput(
                  placeholder: "Ingrese su correo",
                ),
                SizedBox(
                  height: 15,
                ),
                LoginInput(
                  placeholder: "Contraseña",
                ),
              ],
            )),
            TextButton(
              onPressed: () {
                print("boton");
              },
              child: Text(
                "Crear cuenta",
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      letterSpacing: 2)),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: FilledButton(
                  onPressed: () {},
                  child: Text(
                    "Ingresar",
                    style: TextStyle(
                        letterSpacing: 2,
                        color: Color.fromRGBO(11, 34, 181, 1),
                        fontSize: 20),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(244, 232, 105, 1)),
                  )),
              width: size.width,
              height: 50,
            )
          ],
        ),
      ),
    ));
  }
}
