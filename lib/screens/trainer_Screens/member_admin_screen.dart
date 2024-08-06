import 'package:swimmast_movil/screens/trainer_Screens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/screens/trainer_Screens/home_screen.dart';
import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';
import 'package:swimmast_movil/shared/profile_header_trainee.dart';
import 'package:swimmast_movil/widgets/memberTrainerAdmin.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/popover.dart';

class Memberadmin extends StatelessWidget {
  const Memberadmin({super.key});

  @override
  Widget build(BuildContext context) {
    MainScreenTraineeState parentState =
        context.findAncestorStateOfType<MainScreenTraineeState>()!;
    SportBtBar? trainerBtBar;
    int index = 0;

    return Scaffold(
      appBar: index != 4
          ? AppBar(
              actions: [
                ProfileHeaderTrainee(
                  username: userName,
                  message: "Hola, $userName",
                )
              ],
              toolbarHeight: 120,
              automaticallyImplyLeading: false,
            )
          : null,
      body: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        parentState.changeSelected(0, 'Home');
                      },
                    )),
              ]),
          const SizedBox(height: 10),
          const SizedBox(
            width: 360,
            child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)))),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: onlyMembers.isEmpty
                ? Center(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'No existen estudiantes asignados',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: onlyMembers.length,
                    padding: const EdgeInsets.all(12),
                    itemBuilder: (_, index) => MemberAdminCards(
                        onlyMembers[index]['firstName'] +
                            " " +
                            onlyMembers[index]['lastName']),
                  ),
          )
        ],
      ),
    );
  }
}

Widget MemberAdminCards(String name) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    width: 360,
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: styleSubtitles,
                ),
                Text("12 años")
              ],
            ),
            SizedBox(width: 135),
            //PopoverButton(),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            SizedBox(width: 10),
            Membertraineradmin(),
          ],
        ),
      ],
    ),
  );
}
