import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';
import 'package:swimmast_movil/shared/profile_header.dart';
import 'package:swimmast_movil/widgets/router_bottom_nav.dart';

class MainScreenMember extends StatefulWidget {
  const MainScreenMember({super.key});

  @override
  State<MainScreenMember> createState() => _MainScreenMemberState();
}

class _MainScreenMemberState extends State<MainScreenMember> {
  int index = 0;
  MemberBtBar? memberBtBar;
  @override
  void initState() {
    super.initState();
    memberBtBar = MemberBtBar(
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
      bottomNavigationBar: memberBtBar,
      appBar: index != 4
          ? AppBar(
              actions: [
                ProfileHeader(
                  username: "Username",
                  onAvatarTap: () {
                    setState(() {
                      index = 4;
                      memberBtBar = MemberBtBar(
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
      body: BottomRouteMember(index: index),
    );
  }
}
