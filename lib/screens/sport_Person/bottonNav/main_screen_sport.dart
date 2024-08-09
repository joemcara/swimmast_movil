import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';
import 'package:swimmast_movil/widgets/router_bottom_nav.dart';
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
      body: BottomRouteSportPerson(index: index),
    );
  }
}
