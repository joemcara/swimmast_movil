import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/member_Screens/packages_screen.dart';
import 'package:swimmast_movil/shared/button.dart';
import 'package:swimmast_movil/shared/custom_date_dropdown.dart';
import 'package:swimmast_movil/shared/swimmast_tabs.dart';
import 'package:swimmast_movil/widgets/swimmast_card.dart';
import 'package:swimmast_movil/widgets/swimmast_icon_text.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/screens/sport_Person/profile_screen_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/home_screen_sport.dart';
import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';

class ClassScheduleSport extends StatefulWidget {
  const ClassScheduleSport({super.key});

  @override
  State<ClassScheduleSport> createState() =>
      _ClassScheduleSportState();
}

class _ClassScheduleSportState extends State<ClassScheduleSport> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Horarios de clases", 
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}