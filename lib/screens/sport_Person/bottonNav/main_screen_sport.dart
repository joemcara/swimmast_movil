import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';
import 'package:swimmast_movil/shared/profile_header.dart';
import 'package:swimmast_movil/widgets/router_bottom_nav.dart';

class MainScreenSportPerson extends StatefulWidget {
  const MainScreenSportPerson({super.key});

  @override
  State<MainScreenSportPerson> createState() => _MainScreenSportPersonState();
}

class _MainScreenSportPersonState extends State<MainScreenSportPerson> {
  int index = 0;
  SportPerBtBar? sportPerBtBar;
  @override
  void initState() {
    super.initState();
    sportPerBtBar = SportPerBtBar(
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
      bottomNavigationBar: sportPerBtBar,
      appBar: index != 4
          ? AppBar(
              actions: [
                ProfileHeader(
                  username: "Username",
                  onAvatarTap: () {
                    setState(() {
                      index = 4;
                      sportPerBtBar = SportPerBtBar(
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

              leading: AbsorbPointer(
                child: IconButton(
                  icon: const Icon(Icons.emoji_events),
                  iconSize: 70,
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 241, 239, 72)),
                  ),
                  onPressed: () {},
                ),
              ),
            )
          : null,
      body: BottomRouteSportPerson(index: index),
    );
  }
}
