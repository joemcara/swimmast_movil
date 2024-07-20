
import 'package:swimmast_movil/shared/constants.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: swimmastBlue,
              borderRadius:
                  BorderRadius.all(Radius.circular(100))),
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
    );
  }
}