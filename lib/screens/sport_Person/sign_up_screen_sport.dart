import 'package:swimmast_movil/screens/member_Screens/home_screen.dart';
import 'package:swimmast_movil/screens/trainer_Screens/home_screen.dart';
import 'package:swimmast_movil/screens/sport_Person/sign_up_screen_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/signsport.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/datefield.dart';
import 'package:swimmast_movil/shared/inputs.dart';

class SignUpSportScreen extends StatefulWidget {
  const SignUpSportScreen({super.key});

  @override
  State<SignUpSportScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpSportScreen> {
  bool _checkboxValue = false;

  final TextEditingController _names = TextEditingController();
  final TextEditingController _lastNames = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordtwo = TextEditingController();
  final TextEditingController _date = TextEditingController();
  TextEditingController nameRepresentative = TextEditingController();
  TextEditingController relationship = TextEditingController();

  Future<void> _createAccount() async {
    if (_checkboxValue) {
      try {
        if (nameRepresentative.text == '' && relationship.text == '') {
          nameRepresentative.text = 'null';
          relationship.text = 'null';
        }
        final response = await Dio().post(
          urlBack + 'administration/register_user/',
          data: {
            'first_name': _names.text,
            'last_name': _lastNames.text,
            'username': _userName.text,
            'email': _email.text,
            'password': _password.text,
            'confirm_password': _password.text,
            "birthdate": _date.text,
            "age": _age(_date.text),
            'phone_number': _phone.text,
            "role": 3,
            "pass_web": false,
            "representative_name": nameRepresentative.text,
            "representative_relationship": relationship.text,
          },
        );
        if (response.statusCode == 201) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignSportScreen()));
        }

        print(response.data);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('usuario invalido')),
        );
        print(e);
        if (e is DioException) {
          print('Status Code: ${e.response?.statusCode}');
          print('Data: ${e.response?.data}');
        }
      }
    }
  }

  int _age(String date) {
    var now = DateTime.now();
    var birth = DateTime.parse(date);
    var difference = now.difference(birth);
    return difference.inDays ~/ 365;
  }

  @override
  Widget build(BuildContext context) {
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
                  "Creación de cuenta",
                  style: TextStyle(fontSize: 20, color: Colors.white),
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: DateField(
                    names: _names,
                    lastNames: _lastNames,
                    dateController: _date,
                    nameRepresentative: nameRepresentative,
                    relationship: relationship,
                    userName: _userName,
                  ),
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
                PasswordInput(
                  controller: _passwordtwo,
                  hintText: "Repetir contraseña",
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
                        },
                        checkColor: buttoncolorblue,
                        activeColor: buttoncoloryellow,
                        side: BorderSide(color: Colors.white),
                        fillColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return buttoncoloryellow;
                          }
                          return buttoncoloryellow;
                        }),
                      ),
                      const Text(
                        "Aceptar condiciones",
                        style: TextStyle(color: Colors.white),
                      ),
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
