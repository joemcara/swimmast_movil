import 'package:flutter/material.dart';

import 'package:swimmast_movil/screens/member_Screens/history_screen.dart';
import 'package:swimmast_movil/screens/member_Screens/home_screen.dart';
import 'package:swimmast_movil/screens/member_Screens/profile_screen.dart';
import 'package:swimmast_movil/screens/shop_Screens/shop_screen.dart';
import 'package:swimmast_movil/screens/notification_screen.dart';
import 'package:swimmast_movil/screens/sport_Person/history_screen_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/home_screen_sport.dart';
import 'package:swimmast_movil/screens/trainer_Screens/attendance_screen.dart';
import 'package:swimmast_movil/screens/trainer_Screens/home_screen.dart';
import 'package:swimmast_movil/screens/trainer_Screens/profile_screen.dart';
import 'package:swimmast_movil/screens/trainer_Screens/work_out_screen.dart';

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
      ProfileScreenTrainer()
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

class BottomRouteSportPerson extends StatelessWidget {
  final int index;
  const BottomRouteSportPerson({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      HomeScreenSportPerson(),
      HistoryScreenSport(),
      ShopScreen(),
      NotificationScreen(),
      ProfileScreen()
    ];
    return screens[index];
  }
}
