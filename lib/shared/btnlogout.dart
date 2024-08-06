import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/screens/sign_in_screen.dart';

class Btnlogout extends StatelessWidget {
  const Btnlogout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
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
