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
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/screens/sport_Person/widgets_sport/calendar_button.dart';
import 'package:swimmast_movil/screens/sport_Person/widgets_sport/item_selection.dart';
import 'package:swimmast_movil/screens/sport_Person/widgets_sport/history_info_cards.dart';
import 'package:swimmast_movil/screens/sport_Person/widgets_sport/widget_congratulations.dart';

class HistoryScreenSport extends StatefulWidget {
  const HistoryScreenSport({super.key});

  @override
  State<HistoryScreenSport> createState() => _HistoryScreenSportState();
}

class _HistoryScreenSportState extends State<HistoryScreenSport> {
  int _selectedtab = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedtab = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreenSport()),
        );
        break;
      case 1:
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreenSport(context)),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Historial de tiempos",
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0),
            child:
              ItemSelection(
              title: "Seleccionar Estilo",
              styles: ["Estilo 1", "Estilo 2", "Estilo 3"],)
          ),
          Container(
            padding: EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0),
            child: 
            ItemSelection(
              title: "Seleccionar Metraje",
              styles: ["Metraje 1", "Metraje 2", "Metraje 3"],)
          ),
          SizedBox(height: 15),
          CalendarButton(),
          HistoryInfoCards(),
          WidgetCongratulations(style: "title_style", time: "time"),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selected: _selectedtab,
        currentIndex: _onItemTapped,
      ),
    );
  }
}



