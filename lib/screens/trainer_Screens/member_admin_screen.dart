import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/trainer_Screens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/screens/trainer_Screens/home_screen.dart';
import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';
import 'package:swimmast_movil/shared/profile_header_trainee.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/widgets/memberTrainerAdmin.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/popover.dart';

class Memberadmin extends StatelessWidget {
  const Memberadmin({super.key});

  @override
  Widget build(BuildContext context) {
    SportBtBar? trainerBtBar;
    int index = 0;
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Manejar Miembros",
        back: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: isSmallScreen ? screenWidth * 0.9 : 360,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
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
                            fontSize: isSmallScreen ? 14 : 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: onlyMembers.length,
                      padding: const EdgeInsets.all(12),
                      itemBuilder: (_, index) => MemberAdminCards(
                        name: onlyMembers[index]['firstName'] +
                            " " +
                            onlyMembers[index]['lastName'],
                        isSmallScreen: isSmallScreen,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class MemberAdminCards extends StatelessWidget {
  final String name;
  final bool isSmallScreen;

  const MemberAdminCards({
    required this.name,
    required this.isSmallScreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      width: isSmallScreen ? MediaQuery.of(context).size.width * 0.9 : 360,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(width: isSmallScreen ? 10 : 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: styleSubtitles,
                  ),
                  Text(isSmallScreen ? "Edad: 12" : "12 años"),
                ],
              ),
              Spacer(),
            ],
          ),
          SizedBox(height: isSmallScreen ? 5 : 10),
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
}
