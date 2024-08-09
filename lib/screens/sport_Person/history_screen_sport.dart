import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
import 'package:swimmast_movil/widgets/calendar_button.dart';
import 'package:swimmast_movil/widgets/item_selection.dart';
import 'package:swimmast_movil/widgets/history_info_cards.dart';
import 'package:swimmast_movil/widgets/widget_congratulations.dart';
import 'package:swimmast_movil/widgets/history_cards.dart';
import 'package:swimmast_movil/models/styles.dart';

class HistoryScreenSport extends StatefulWidget {
  const HistoryScreenSport({super.key});

  @override
  State<HistoryScreenSport> createState() => _HistoryScreenSportState();
}

class _HistoryScreenSportState extends State<HistoryScreenSport> {
  int _selectedtab = 0;

  List<Styles>? styles;
  List<String> name_styles = ['TODO'];
  String filterStyle = 'TODO';
  String filterTime = 'TODO';

  List<Map<String, String>> history_info = [
    {'id': '1', 'title': '100 PECHO', 'time': '1:00'},
    {'id': '2', 'title': '200 MARIPOSA', 'time': '2:00'},
    {'id': '3', 'title': '50 LIBRE', 'time': '3:00'},
    {'id': '4', 'title': '200 COMBINADO', 'time': '4:00'},
    {'id': '4', 'title': '400 LIBRE', 'time': '5:00'},
    {'id': '4', 'title': '200 ESPALDA', 'time': '6:00'},
  ];

  List<Map<String, String>> filtered_history_info = [];

  @override
  void initState() {
    super.initState();
    filtered_history_info = history_info;
    getStyles();
  }

   Future<void> getStyles() async {
    var response = await Dio().get(urlBack + 'style');
    
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      styles = data.map((json) => Styles.fromJson(json)).toList();
      setState(() {}); 
      nameStyles();
    }
  }

  void nameStyles(){
    if(styles != null){
    name_styles.addAll(styles!.map((style) => style.name).toList()); 
    setState(() {});
    } 
  }

  void updateFilterStyle(String newStyle, String newTime) {
    setState(() {
      filterStyle = newStyle;
      filterTime = newTime;
      if (filterTime == 'TODO') {
        if (filterStyle == 'TODO') {
          filtered_history_info = history_info;
        } else {
          filtered_history_info = history_info
              .where((item) => item['title']!.contains(filterStyle))
              .toList();
        }
      } else {
        if (filterStyle == 'TODO') {
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
          MaterialPageRoute(builder: (context) => ProfileScreenSport()),
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
          SizedBox(height: 15),
          Card.outlined(
            margin: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
            child: Container(
                child: ItemSelection(
                    title: "Seleccionar Estilo",
                    styles: name_styles,
                    onSelected: (newFilter) =>
                        updateFilterStyle(newFilter, filterTime)
                )
            ),
          ),
          Card.outlined(
            margin: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
            child: Container(
              child: ItemSelection(
                  title: "Seleccionar Metraje",
                  styles: ['TODO', '50', '100', '200', '400', '800', '1500'],
                  onSelected: (newFilter) =>
                      updateFilterStyle(filterStyle, newFilter))),
          ),
          SizedBox(height: 15),
          Expanded(
              child: ListView.builder(
                  itemCount: filtered_history_info.length,
                  itemBuilder: (context, index) => HistoryCards(
                        title_style: filtered_history_info[index]['title']!,
                        time: filtered_history_info[index]['time']!,
                      ))),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
