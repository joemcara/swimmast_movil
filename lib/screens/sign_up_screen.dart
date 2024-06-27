
import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/button.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/inputs.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _checkboxValue = false;
  final TextEditingController _names = TextEditingController();
  final TextEditingController _lastNames = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();


  Future<void> _createAccount() async {
    try {

      final response = await Dio().post(
        urlBack + 'register/',
        data: {
          'first_name': _names.text,
          'last_name': _lastNames.text,
          'cell_phone': _phone.text,
          'email': _email.text,
          'password': _password.text,
          'confirm_password': _password.text,
          "date_of_birth":"2002-12-27",
          "age": 17,
          "role": 1,
          "representative_name": "yo",
          "representative_relationship": "papa"
        },
      );

      print(response.data);
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
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
                const Text(
                  "Creación de cuenta",
                  style: TextStyle(fontSize: 20),
                ),
                 TextInput(
                  controller: _names,
                  hintText: "Nombres",
                  label: "Nombres",
                ),
                 TextInput(
                  controller: _lastNames,
                  hintText: "Apellidos",
                  label: "Apellidos",
                ),
                 TextInput(
                  controller: _phone,
                  hintText: "Teléfono",
                  label: "Número de teléfono",
                ),
                 TextInput(
                  controller: _email,
                  hintText: "Correo electrónico",
                  label: "Correo electrónico",
                ),
                 PasswordInput(
                  controller: _password,
                  hintText: "Contraseña",
                  label: "Contraseña",
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
                      const Text("Aceptar condiciones"),
                    ],
                  ),
                ),
                CustomButton(
                    text: "Crear",
                    onPressed: () {
                      _createAccount();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
