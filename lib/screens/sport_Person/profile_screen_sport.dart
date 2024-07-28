import 'package:swimmast_movil/screens/edit_profile.dart';
import 'package:swimmast_movil/shared/change_password.dart';
import 'package:swimmast_movil/shared/constants.dart';

class ProfileScreenSport extends StatefulWidget {
  const ProfileScreenSport(BuildContext context, {super.key});

  @override
  State<ProfileScreenSport> createState() => _ProfileScreenSportState();
}

class _ProfileScreenSportState extends State<ProfileScreenSport> {

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;

    Future _logout() async {
      try{
        await Dio().post(
          urlBack + 'administration/logout_user/',
          options: Options(
            headers: {
              'Authorization': 'Token $token'
            }
          )
        );

      } catch(e){
        print(e);
      }
      miembro = null;
    }

    List<String> data = [
      "Número de teléfono: $phoneNumber",
      "Fecha de nacimiento: $birthDate",
    ];

    List<String> packages = userCourse.cast<String>();


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
                      username: miembro!.user.firstName[0].toUpperCase(),
                      onTap: () {},
                    ),
                  ),
                ),
                Text(
                  miembro!.user.firstName + " " + miembro!.user.lastName,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                CustomTextButton(
                  text: "Editar perfil",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfile()));
                  },
                  text_color: swimmastBlue,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _infoBox("Información general", data),
                      const SizedBox(
                        height: 32,
                      ),
                      _infoBox("Cursos Inscritos", packages),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  height: 48,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChangePassword(),
                      const Icon(
                        Icons.keyboard_arrow_right_outlined,
                      )
                    ],
                  ),
                ),
                CustomButton(
                    text: "Cerrar sesión",
                    onPressed: () async{
                      await _logout();
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