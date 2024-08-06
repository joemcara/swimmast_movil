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
import 'package:swimmast_movil/screens/sport_Person/widgets_sport/history_cards.dart';

class HistoryScreenSport extends StatefulWidget {
  const HistoryScreenSport({super.key});

  @override
  State<HistoryScreenSport> createState() => _HistoryScreenSportState();
}

class _HistoryScreenSportState extends State<HistoryScreenSport> {
  int _selectedtab = 0;

  String filterStyle = 'Todo';
  String filterTime = 'Todo';

  List<Map<String, String>> history_info = [
    {'id': '1', 'title': '100 Pecho', 'time': '1:00'},
    {'id': '2', 'title': '200 Mariposa', 'time': '2:00'},
    {'id': '3', 'title': '50 Libre', 'time': '3:00'},
    {'id': '4', 'title': '200 Combinado', 'time': '4:00'},
    {'id': '4', 'title': '400 Libre', 'time': '5:00'},
    {'id': '4', 'title': '200 Espalda', 'time': '6:00'},
  ];

  List<Map<String, String>> filtered_history_info = [];

  @override
  void initState(){
    super.initState();
    filtered_history_info = history_info;
  }
  
  void updateFilterStyle(String newStyle, String newTime) {
    setState(() {
      filterStyle = newStyle;
      filterTime = newTime;
      if(filterTime == 'Todo'){
        if (filterStyle == 'Todo') {
        filtered_history_info = history_info;
        } else {
        filtered_history_info = history_info
            .where((item) => item['title']!.contains(filterStyle))
            .toList();
        }  
      } else{
        if (filterStyle == 'Todo') {
          filtered_history_info = history_info
              .where((item) => item['title']!.contains(filterTime))
              .toList();
        } else {
          filtered_history_info = history_info
            .where((item) => item['title']!.contains(filterStyle))
            .where((item) => item['title']!.contains(filterTime))
            .toList();
        }   
      }
    });
  }

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
              styles: ['Todo', 'Combinado', 'Libre', 'Pecho', 'Mariposa', 'Espalda'],
              onSelected: (newFilter) => updateFilterStyle(newFilter,filterTime)
              )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0),
            child: 
              ItemSelection(
                title: "Seleccionar Metraje",
                styles: ['Todo', '50', '100', '200', '400', '800', '1500'],
                onSelected: (newFilter) => updateFilterStyle(filterStyle,newFilter)
              )
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: filtered_history_info.length,
              itemBuilder: (context, index) => HistoryCards(
                title_style: filtered_history_info[index]['title']!,
                time: filtered_history_info[index]['time']!,
              )
            )
          ),
          SizedBox(height: 15),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selected: _selectedtab,
        currentIndex: _onItemTapped,
      ),
    );
  }
}