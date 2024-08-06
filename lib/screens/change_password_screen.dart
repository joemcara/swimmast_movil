import 'package:swimmast_movil/models/member.dart';
import 'package:swimmast_movil/screens/member_Screens/bottomNav/main_screen_member.dart';
import 'package:swimmast_movil/screens/trainer_Screens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/inputs.dart';
import 'package:swimmast_movil/screens/sign_up_screen.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
      appBar: CustomAppBar(
        title: "Cambiar Contraseña",
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(54, 218, 229, 240),
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
                    height: 200,
                    width: 200,
                  ),
                ),
                const Text(
                  "Cambiar Contraseña",
                  style: TextStyle(fontSize: 25, color: buttoncolorblue),
                ),
                TextInput(
                  controller: _password,
                  hintText: "Contraseña anterior",
                  label: "Contraseña anterior",
                ),
                TextInput(
                  controller: _password,
                  hintText: "Nueva Contraseña",
                  label: "Nueva Contraseña",
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
                    child: const Text("Cambiar contraseña",
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
