import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';
import 'package:swimmast_movil/shared/profile_header.dart';
import 'package:swimmast_movil/widgets/router_bottom_nav.dart';
import 'package:swimmast_movil/screens/sport_Person/competitions_screen.dart';
class MainScreenSportPerson extends StatefulWidget {
  const MainScreenSportPerson({super.key});

  @override
  State<MainScreenSportPerson> createState() => _MainScreenSportPersonState();
}

class _MainScreenSportPersonState extends State<MainScreenSportPerson> {
  int index = 0;
  bool isVisible = true;
  SportPerBtBar? sportPerBtBar;
  @override
  void initState() {
    super.initState();
    sportPerBtBar = SportPerBtBar(
      currentIndex: (index) {
        setState(() {
          this.index = index;
          this.isVisible = true;
        });
      },
      selected: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: sportPerBtBar,
      appBar: index != 6
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
              leading: Visibility(
                  visible: isVisible,
                  child: IconButton(
                      icon: const Icon(Icons.emoji_events),
                      iconSize: 70,
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(244, 195, 20, 100)),
                      ),
                      onPressed: ()=>{
                        index = 5,
                        setState(() {
                          this.index = index;
                          this.isVisible = false;
                        })
                      }
              ),
              ),
              /*leading: IconButton(
                  icon: const Icon(Icons.emoji_events),
                  iconSize: 70,
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 241, 239, 72)),
                  ),
                  onPressed: ()=>{
                    index = 4,
                    setState(() {
                        this.index = index;
                    })
                      /*Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => CompetitionsScreen()))*/
                  },
              ),*/
            )
          : null,
      body: BottomRouteSportPerson(index: index),
    );
  }
}
