import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/bottom_nav_bar.dart';
import 'package:swimmast_movil/widgets/router_bottom_nav.dart';


class MainScreenTrainee extends StatefulWidget {
  const MainScreenTrainee({super.key});

  @override
  State<MainScreenTrainee> createState() => _MainScreenTraineeState();
}

class _MainScreenTraineeState extends State<MainScreenTrainee> {
  int index = 0;
  TrainerBtBar ?trainerBtBar;

  @override
  void initState() {
    super.initState();
    trainerBtBar = TrainerBtBar(
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
      body: BottomRouteTrainee(index: index),
      );
  }
}