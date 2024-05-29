import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/button.dart';
import 'package:swimmast_movil/shared/button.dart' as customText;
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/inputs.dart' as input;
import 'package:swimmast_movil/shared/profile_header.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: statusBarHeight * 1.5),
            child: SingleChildScrollView(
                child: Column(children: [
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: (MediaQuery.of(context).size.width) / 3.7),
                    Text("Editar perfil", style: styleTitles),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: CustomAvatar(
                          username: "Luis García",
                          onTap: () {},
                        ),
                      ),
                      const Text(
                        "Luis García",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      customText.CustomTextButton(
                          text: "Cambiar foto", onPressed: () {}),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: const Center(
                            child: SingleChildScrollView(
                          child: Wrap(
                            runSpacing: 30.0,
                            alignment: WrapAlignment.center,
                            children: [
                              input.TextInput(
                                hintText: "Nombres y apellidos",
                                label: "Nombres y apellidos",
                              ),
                              SizedBox(height: 10),
                              input.TextInput(
                                label: "Email",
                                hintText: "Email",
                              ),
                              input.TextInput(
                                hintText: "Número de Teléfono",
                                label: "Número de Teléfono",
                              ),
                              input.TextInput(
                                hintText: "Dirección",
                                label: "Dirección",
                              )
                            ],
                          ),
                        )))),
                const SizedBox(
                  height: 35,
                ),
                CustomButton(
                    text: "Guardar",
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ])
            ]))));
  }
}
