import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';
import 'package:swimmast_movil/widgets/router_bottom_nav.dart';

class MainScreenMember extends StatefulWidget {
  const MainScreenMember({super.key});

  @override
  State<MainScreenMember> createState() => _MainScreenMemberState();
}

class _MainScreenMemberState extends State<MainScreenMember> {
  int index = 0;
  MemberBtBar? trainerBtBar;

  @override
  void initState() {
    super.initState();
    trainerBtBar = MemberBtBar(
      currentIndex: (index) {
        setState(() {
          this.index = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: trainerBtBar,
      body: BottomRouteMember(index: index),
    );
  }
}
