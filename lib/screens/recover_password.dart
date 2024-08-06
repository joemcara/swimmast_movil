import 'package:swimmast_movil/models/member.dart';
import 'package:swimmast_movil/screens/member_Screens/bottomNav/main_screen_member.dart';
import 'package:swimmast_movil/screens/trainer_Screens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/inputs.dart';
import 'package:swimmast_movil/screens/sign_up_screen.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final TextEditingController _userName = TextEditingController();

  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _login() async {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController _email = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: defaultGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
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
                  "Recuperar Cuenta",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                TextInput(
                  controller: _email,
                  hintText: "Correo electrónico",
                  label: "Correo electrónico",
                ),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: FilledButton(
                    onPressed: () async {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(buttoncoloryellow),
                    ),
                    child: const Text("Recuperar contraseña",
                        style: TextStyle(
                          letterSpacing: 2,
                          color: buttoncolorblue,
                          fontSize: 16,
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
