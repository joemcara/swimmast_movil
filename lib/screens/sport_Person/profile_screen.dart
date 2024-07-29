import 'package:swimmast_movil/screens/edit_profile.dart';
import 'package:swimmast_movil/screens/trainer_Screens/member_admin_screen.dart';
import 'package:swimmast_movil/shared/button.dart' as customText;
import 'package:swimmast_movil/shared/button_Rectangle.dart';
import 'package:swimmast_movil/shared/constants.dart';

class ProfileScreenTrainer extends StatefulWidget {
  const ProfileScreenTrainer(BuildContext context, {super.key});

  @override
  State<ProfileScreenTrainer> createState() => _ProfileScreenTrainerState();
}

class _ProfileScreenTrainerState extends State<ProfileScreenTrainer> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;

    Future<void> _logout() async {
      try {
        await Dio().post(urlBack + 'administration/logout_user/',
            options: Options(headers: {'Authorization': 'token $token'}));
      } catch (e) {
        print(e);
      }
      miembro = null;
    }

    const List<String> data = [
      "Número de teléfono: 1234567890",
      "Dirección: Av.9 de octubre y Chimborazo "
    ];

    List<String> courses = [
      "Curso: Entrenamientos",
      'Cursos a cargo: ${coursesList.length}'
    ];

    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: statusBarHeight * 1.5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: CustomAvatar(
                      username: userName,
                      onTap: () {},
                    ),
                  ),
                ),
                Text(
                  miembro!.user.firstName + " " + miembro!.user.lastName,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                customText.CustomTextButton(
                    text: "Editar Perfil",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(),
                          ));
                    }),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _infoBox("Información general", courses),
                      const SizedBox(
                        height: 32,
                      ),
                      _infoBox("Información de Contacto", data),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                  width: 380,
                  child: CustomButtonRectangle(
                    text: "Manejar Miembros",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Memberadmin()));
                    },
                    icon: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomButton(
                    text: "Cerrar sesión",
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          )),
    );
  }
}

Widget _infoBox(String title, List<String> data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data
              .map((e) => Text(
                    e,
                    style: const TextStyle(fontSize: 18),
                  ))
              .toList(),
        ),
      )
    ],
  );
}
