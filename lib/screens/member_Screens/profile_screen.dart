import 'package:swimmast_movil/screens/edit_profile.dart';
import 'package:swimmast_movil/shared/btnlogout.dart';
import 'package:swimmast_movil/shared/change_password_w.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';

class ProfileScreen extends StatefulWidget {
  //const ProfileScreen(BuildContext context, {super.key});
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;

    List<String> data = [
      "Número de teléfono: ${miembro!.user.phoneNumber}",
      "Fecha de nacimiento: $birthDate",
    ];

    List<String> packages = userCourse.cast<String>();

    return Scaffold(
      appBar: CustomAppBar(
        title: "Perfil",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: statusBarHeight * 1.5),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            Center(
              child: SizedBox(
                height: size.height * 0.2,
                width: size.height * 0.2,
                child: CustomAvatar(
                  username: miembro!.user.firstName[0].toUpperCase(),
                  onTap: () {},
                ),
              ),
            ),
            Text(
              miembro!.user.firstName + " " + miembro!.user.lastName,
              style: TextStyle(
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomTextButton(
              text: "Editar perfil",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
              text_color: buttoncolorblue,
            ),
            SizedBox(height: size.height * 0.03),
            Divider(),
            SizedBox(height: size.height * 0.01),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                children: [
                  _infoBox("Información general", data),
                  SizedBox(height: size.height * 0.03),
                  if(!packages.isNotEmpty)
                    _infoBox("Cursos Inscritos", ['Aún no te has inscrito a ningún curso :c']),
                  _infoBox("Cursos Inscritos", packages),
                    
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              height: size.height * 0.07,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChangePasswordW(),
                  const Icon(
                    Icons.keyboard_arrow_right_outlined,
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              height: size.height * 0.07,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: defaultGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Btnlogout(),
                  const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
