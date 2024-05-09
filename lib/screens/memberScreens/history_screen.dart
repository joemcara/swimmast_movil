import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/profile_header.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: statusBarHeight),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

Widget _tabs() {
  return const TabBar(tabs: [
    Tab(
      text: "Horarios",
    ),
    Tab(
      text: "Sesiones",
    ),
  ]);
}
