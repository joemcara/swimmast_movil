import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/edit_profile.dart';
import 'package:swimmast_movil/screens/trainer_Screens/member_admin_screen.dart';
import 'package:swimmast_movil/shared/button.dart';
import 'package:swimmast_movil/shared/button.dart' as customText;
import 'package:swimmast_movil/shared/button_Rectangle.dart';
import 'package:swimmast_movil/shared/profile_header.dart';

class ProfileScreenTrainer extends StatelessWidget {
  const ProfileScreenTrainer({super.key});
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;

    const List<String> data = [
      "Número de teléfono: 1234567890",
      "Dirección: Av.9 de octubre y Chimborazo "
    ];

    const List<String> courses = ["Curso: Entrenamientos", "Cursos a cargo: 4"];

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
                      username: "Evelyn Smith",
                      onTap: () {},
                    ),
                  ),
                ),
                const Text(
                  "Luis García",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                customText.CustomTextButton(
                    text: "Editar Perfil",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfile(),
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
