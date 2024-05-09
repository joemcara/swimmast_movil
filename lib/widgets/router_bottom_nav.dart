import 'package:flutter/material.dart';

import 'package:swimmast_movil/screens/memberScreens/history_screen.dart';
import 'package:swimmast_movil/screens/memberScreens/home_screen.dart';
import 'package:swimmast_movil/screens/memberScreens/profile_screen.dart';
import 'package:swimmast_movil/screens/memberScreens/shop_screen.dart';
import 'package:swimmast_movil/screens/trainerScreens/attendance_screen.dart';
import 'package:swimmast_movil/screens/trainerScreens/group_screen.dart';
import 'package:swimmast_movil/screens/trainerScreens/home_screen.dart';
import 'package:swimmast_movil/screens/notification_screen.dart';
import 'package:swimmast_movil/screens/trainerScreens/work_out_screen.dart';

class BottomRouteTrainee extends StatelessWidget {
  final int index;
  const BottomRouteTrainee({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      HomeScreen(),
      AttendanceScreen(),
      WorkoutScreen(),
      NotificationScreen(),
      GroupScreen()
    ];
    return screens[index];
  }
}

class BottomRouteMember extends StatelessWidget {
  final int index;
  const BottomRouteMember({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      HomeScreenMember(),
      HistoryScreen(),
      ShopScreen(),
      NotificationScreen(),
      ProfileScreen()
    ];
    return screens[index];
  }
}
