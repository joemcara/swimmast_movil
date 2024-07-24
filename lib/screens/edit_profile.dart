import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swimmast_movil/shared/button.dart' as customText;
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/inputs.dart' as input;

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  File? image;
  late TextEditingController _names = TextEditingController();
  late TextEditingController _lastnames = TextEditingController();
  late TextEditingController _address = TextEditingController();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

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
                    SizedBox(width: (MediaQuery.of(context).size.width)/5),
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
                          username: miembro!.user.firstName,
                          onTap: () {},
                          image: image,
                        ),
                      ),
                      Text(
                        miembro!.user.firstName + " " + miembro!.user.lastName,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      customText.CustomTextButton(
                          text: "Cambiar foto",
                          onPressed: () {
                            pickImage();
                          }),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Center(
                            child: SingleChildScrollView(
                          child: Wrap(
                            runSpacing: 30.0,
                            alignment: WrapAlignment.center,
                            children: [
                              input.TextInput(
                                hintText: "Nombres",
                                label: "Nombres y apellidos",
                                controller: _names,
                              ),
                              input.TextInput(
                                hintText: "apellidos",
                                label: "Apellidos",
                                controller: _lastnames,
                              ),
                              input.TextInput(
                                hintText: "Dirección",
                                label: "Dirección",
                                controller: _address,
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
            ]
            )
            )
            )
            );
  }
}