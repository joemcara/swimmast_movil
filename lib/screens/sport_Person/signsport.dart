import 'package:swimmast_movil/models/member.dart';
import 'package:swimmast_movil/screens/member_Screens/bottomNav/main_screen_member.dart';
import 'package:swimmast_movil/screens/trainer_Screens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/inputs.dart';
import 'package:swimmast_movil/screens/sport_Person/sign_up_screen_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/recover_password_sport.dart';
import 'package:swimmast_movil/shared/inputs.dart';

class SignSportScreen extends StatefulWidget {
  const SignSportScreen({super.key});

  @override
  State<SignSportScreen> createState() => _SignSportScreenState();
}

class _SignSportScreenState extends State<SignSportScreen> {
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
    final TextEditingController _password = TextEditingController();
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: defaultGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: statusBarHeight),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.9,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Image.asset(
                              "lib/assets/swimmast_logo.png",
                              height: size.height * 0.20,
                              width: size.width * 0.7,
                            ),
                          ),
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
                                fontSize: 30,
                                color: Colors.white,
                                letterSpacing: 2),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Wrap(
                            runSpacing: 15.0,
                            alignment: WrapAlignment.center,
                            children: [
                              TextInput(
                                controller: _email,
                                hintText: "Correo electrónico",
                                label: "Correo electrónico",
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              PasswordInput(
                                controller: _password,
                                hintText: "Contraseña",
                                label: "Contraseña",
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpSportScreen()));
                            },
                            text: "Crear cuenta",
                            text_color: Colors.white,
                          ),
                          const SizedBox(
                            height: 0.5,
                          ),
                          CustomTextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RecoverPasswordSport()));
                            },
                            text: "Recuperar Contraseña",
                            text_color: Colors.white,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          SizedBox(
                            width: size.width,
                            height: 50,
                            child: FilledButton(
                                onPressed: () async {
                                  await _login();
                                  if (miembro == null) {
                                    showError(
                                        "Usuario no registrado. Por favor regístrese.");
                                  } else {
                                    if (miembro!.roleName == "MIEMBRO") {
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
                                                  const MainScreenTrainee()));
                                    }
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      buttoncoloryellow),
                                ),
                                child: const Text(
                                  "Ingresar",
                                  style: TextStyle(
                                      letterSpacing: 2,
                                      color: buttoncolorblue,
                                      fontSize: 20),
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
