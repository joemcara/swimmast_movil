import 'package:swimmast_movil/models/member.dart';
import 'package:swimmast_movil/screens/member_Screens/bottomNav/main_screen_member.dart';
import 'package:swimmast_movil/screens/sign_up_screen.dart';
import 'package:swimmast_movil/screens/trainer_Screens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/inputs.dart';

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
      urlBack + 'login_user/',
      data: {
        'username': _userName.text,
        'password': _password.text,
      },
      
    );
    
    if (response.data['status'] == 400) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not registered. Please sign up.')),
      );
    } else {
      miembro = Member.fromJson(response.data);
      token = response.data['token'];
      idUser = response.data['user']['id'];
    }

  } catch (e) {
    print(e);
  }
}

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
              Expanded(
                child: SizedBox(
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
                    Form(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        TextInput(
                          controller: _userName,
                          hintText: "Ingrese su correo",
                          signIn: true,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        PasswordInput(
                          controller: _password,
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
                          onPressed: () async{
                            await _login();
                            if (miembro == null) {
                              showError("Usuario no registrado. Por favor regístrese.");
                            }else{
                            if (miembro!.user.role.name == "MIEMBRO") {
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
