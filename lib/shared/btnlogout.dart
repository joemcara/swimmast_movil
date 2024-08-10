import 'package:swimmast_movil/screens/sign_in_screen.dart';
import 'package:swimmast_movil/shared/constants.dart';

class Btnlogout extends StatelessWidget {
  const Btnlogout({
    super.key,
  });

  
  Future _logout() async {
    try {
      await Dio().post(urlBack + 'administration/logout_user/',
          options: Options(headers: {'Authorization': 'Token $token'}));
    } catch (e) {
      print(e);
    }
    miembro = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        await _logout();
        Navigator.pop(
          context,
          MaterialPageRoute(builder: (context) => SignInScreen()),
        );
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            child: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Text(
            "Cerrar Sesión",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
