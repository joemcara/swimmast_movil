import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/trainerScreens/attendance_screen.dart';
import 'package:swimmast_movil/screens/trainerScreens/group_screen.dart';
import 'package:swimmast_movil/screens/trainerScreens/home_screen.dart';
import 'package:swimmast_movil/screens/trainerScreens/notification_screen.dart';
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

