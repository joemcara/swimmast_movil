import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/screens/change_password_screen.dart';

class ChangePasswordW extends StatelessWidget {
  const ChangePasswordW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChangePasswordScreen(),
          ),
        );
      },
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: buttoncolorblue,
                borderRadius: BorderRadius.all(Radius.circular(100))),
            padding: const EdgeInsets.all(6),
            child: const Icon(
              Icons.lock,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Text(
            "Cambiar contraseña",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
