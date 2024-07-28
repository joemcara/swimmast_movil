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

class HistoryScreenSport extends StatefulWidget {
  const HistoryScreenSport({super.key});

  @override
  State<HistoryScreenSport> createState() =>
      _HistoryScreenSportState();
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
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selected: _selectedtab,
        currentIndex: _onItemTapped,
      ),
    );
  }
}
