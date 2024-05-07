import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swimmast_movil/screens/sign_in_screen.dart';
import 'package:swimmast_movil/shared/button.dart';
import 'package:swimmast_movil/shared/inputs.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: SingleChildScrollView(
            child: Wrap(
              runSpacing: 15.0,
              alignment: WrapAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'lib/assets/swimmast_logo.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                Text(
                  "Creación de cuenta",
                  style: TextStyle(fontSize: 20),
                ),
                SignUpInput(
                  hintText: "Nombres y Apellidos",
                  label: "Nombres y Apellidos",
                ),
                SignUpInput(
                  hintText: "Teléfono",
                  label: "Número de teléfono",
                ),
                SignUpInput(
                  hintText: "Correo electrónico",
                  label: "Correo electrónico",
                ),
                SignUpInput(
                  hintText: "Contraseña",
                  label: "Contraseña",
                  password: true,
                ),
                SignUpInput(
                  hintText: "Dirección",
                  label: "Dirección ",
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _checkboxValue = !_checkboxValue;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          value: _checkboxValue,
                          onChanged: (value) {
                            setState(() {
                              _checkboxValue = value!;
                            });
                          }),
                      Text("Aceptar condiciones"),
                    ],
                  ),
                ),
                CustomButton(
                    text: "Crear",
                    onPressed: () {
                      print("IMPRIMIENDO");
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
