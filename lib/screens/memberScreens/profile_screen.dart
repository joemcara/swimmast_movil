import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/button.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const List<String> data = [
      "Número de teléfono: 1234567890",
      "Dirección: Av.9 de octubre y Chimborazo "
    ];

    const List<String> packages = [
      "Paquete X - Lunes 8:30 - 11:00am",
      "Paquete Y - Lunes 10:30 - 13:00am",
      "Paquete Z - Lunes 8:30 - 11:00am",
    ];

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Center(
              child: Container(
                height: 150,
                width: 150,
                child: Expanded(
                  child: CustomAvatar(
                    username: "Evelyn Smith",
                    onTap: () {},
                  ),
                ),
              ),
            ),
            Text(
              "Evelyn Smith",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            CustomTextButton(
              text: "Editar perfil",
              onPressed: () {},
              text_color: system_blue,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _infoBox("Información general", data),
                  SizedBox(
                    height: 32,
                  ),
                  _infoBox("Paquetes inscritos", packages),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              padding: EdgeInsets.symmetric(horizontal: 4),
              height: 48,
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: system_blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Cambiar contraseña",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                  )
                ],
              ),
            ),
            CustomButton(text: "Cerrar sesión", onPressed: () {})
          ],
        ));
  }
}

Widget _infoBox(String title, List<String> data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      SizedBox(
        height: 8,
      ),
      Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data
              .map((e) => Text(
                    e,
                    style: TextStyle(fontSize: 18),
                  ))
              .toList(),
        ),
      )
    ],
  );
}
