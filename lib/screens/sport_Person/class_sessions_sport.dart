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
import 'package:swimmast_movil/widgets/widget_performed.dart';
import 'package:swimmast_movil/widgets/routine_info_cards.dart';
class ClassSessionsSport extends StatefulWidget {
  const ClassSessionsSport({super.key});

  @override
  State<ClassSessionsSport> createState() =>
      _ClassSessionsSportState();
}

class _ClassSessionsSportState extends State<ClassSessionsSport> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sessiones de clases", 
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          WidgetPerformed(),
          SizedBox(height: 20),
          /*Container(
            padding: EdgeInsets.fromLTRB(120.0, 0.0, 120.0, 0),
            child: ItemSelection(
              title: "Rutinas",
              styles: ["Rutina Realizada", "Rutina No Realizada", "Rutinas"],)
            ),*/
          SizedBox(height: 10),
          RoutineInfoCards()
        ],
      ),
    );
  }
}
