import 'package:swimmast_movil/models/member.dart';
import 'package:swimmast_movil/screens/member_Screens/bottomNav/main_screen_member.dart';
import 'package:swimmast_movil/screens/member_Screens/home_screen_member.dart';
import 'package:swimmast_movil/screens/sign_up_screen.dart';
import 'package:swimmast_movil/screens/sport_Person/home_screen_sport.dart';
import 'package:swimmast_movil/screens/trainer_Screens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/inputs.dart';
import 'package:swimmast_movil/screens/recover_password.dart';
import 'package:swimmast_movil/shared/inputs.dart';
import 'package:swimmast_movil/screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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

  Future<void> _login() async {
    try {
      final response = await Dio().post(
        urlBack + 'administration/login_user/',
        data: {
          'username': _userName.text,
          'password': _password.text,
        },
      );
      print(response.data);

      miembro = Member.fromJson(response.data);
      token = response.data['token'];
      idUser = response.data['user']['id'];

      if (miembro!.roleName == "MIEMBRO") {
        birthDate = response.data['user']['birthdate'];
        phoneNumber = response.data['phone_number'];
        userName = response.data['user']['username'];
      } else if (miembro!.roleName == "INSTRUCTOR") {
        userName = response.data['user']['first_name'];
      } else if (miembro!.roleName == "DEPORTISTA") {
        userName = response.data['user']['first_name'];
      }

    } catch (e) {
      if (e is DioException) {
        print('Status Code: ${e.response?.statusCode}');
        print('Data: ${e.response?.data}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                                controller: _userName,
                                hintText: "Ingrese su Usuario",
                                label: "Ingrese su Usuario",
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
                                          const SignUpScreen()));
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
                                          const RecoverPassword()));
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
                                                  const HomeScreenMember()));
                                    } else if (miembro!.roleName == "INSTRUCTOR") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MainScreenTrainee()));
                                    } else if (miembro!.roleName == "DEPORTISTA") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HomeScreenSport()));
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
