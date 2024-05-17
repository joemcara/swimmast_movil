import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/memberScreens/profile_screen.dart';
import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/profile_header.dart';
import 'package:swimmast_movil/shared/profile_header_trainee.dart';
import 'package:swimmast_movil/widgets/router_bottom_nav.dart';

class MainScreenTrainee extends StatefulWidget {
  const MainScreenTrainee({super.key});

  @override
  State<MainScreenTrainee> createState() => MainScreenTraineeState();
}

class MainScreenTraineeState extends State<MainScreenTrainee> {
  int index = 0;
  TrainerBtBar? trainerBtBar;
  @override
  void initState() {
    super.initState();
    trainerBtBar = TrainerBtBar(
      currentIndex: (index) {
        setState(() {
          this.index = index;
        });
      },
      selected: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: trainerBtBar,
      appBar: index != 4
          ? AppBar(
              actions: [
                ProfileHeaderTrainee(
                  username: "Username",
                  onAvatarTap: () {
                    setState(() {
                      index = 4;
                      trainerBtBar = TrainerBtBar(
                        currentIndex: (index) {
                          setState(() {
                            this.index = index;
                          });
                        },
                        selected: index,
                      );
                    });
                  },
                )
              ],
              toolbarHeight: 120,
              automaticallyImplyLeading: false,
            )
          : null,
      body: BottomRouteTrainee(index: index),
    );
  }
}
