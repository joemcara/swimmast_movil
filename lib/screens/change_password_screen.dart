import 'package:swimmast_movil/screens/member_Screens/bottomNav/main_screen_member.dart';
import 'package:swimmast_movil/screens/sign_in_screen.dart';
import 'package:swimmast_movil/screens/sport_Person/bottonNav/main_screen_sport.dart';
import 'package:swimmast_movil/screens/trainer_Screens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/shared/btnlogout.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/inputs.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _newPasswordR = TextEditingController();

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

    void showModal(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Informacion!"),
          content: Text(errorMessage),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () async{
                  await _logout();
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignInScreen()));
              },
            ),
          ],
        );
      },
    );
  }

    Future _logout() async {
    try {
      await Dio().post(urlBack + 'administration/logout_user/',
          options: Options(headers: {'Authorization': 'Token $token'}));
    } catch (e) {
      print(e);
    }
    miembro = null;
  }


  Future<void> _changePassword() async {
    try {
      final response = await Dio().post(
        urlBack + 'administration/reset_password/',
        data: {
          "username": miembro!.user.username,
          "password": _oldPassword.text,
          "new_password": _newPassword.text,
          "confirm_password": _newPasswordR.text,
        },
      );
      if(response.statusCode == 200){
        showModal("Contraseña cambiada con éxito");
      }

    } catch (e) {
      if (e is DioException) {
        showError(e.response?.data);
      }

      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: "Cambiar Contraseña",
        back: true,
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
                  controller: _oldPassword,
                  hintText: "Contraseña anterior",
                  label: "Contraseña anterior",
                ),
                PasswordInput(
                  controller: _newPassword,
                  hintText: "Nueva Contraseña",
                  label: "Nueva Contraseña",
                ),
                PasswordInput(
                  controller: _newPasswordR,
                  hintText: "Repita la contraseña",
                  label: "Nueva Contraseña",
                ),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: FilledButton(
                    onPressed: () async {
                      if (_oldPassword.text.isEmpty ||
                          _newPassword.text.isEmpty ||
                          _newPasswordR.text.isEmpty) {
                        showError("Por favor, llene todos los campos");
                      } else if (_newPassword.text != _newPasswordR.text) {
                        showError("Las contraseñas no coinciden");
                      } else {
                        await _changePassword();

                      }
                    },
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
