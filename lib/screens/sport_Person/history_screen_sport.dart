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
import 'package:swimmast_movil/screens/sport_Person/calendar_button.dart';
import 'package:swimmast_movil/shared/constants.dart';

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
          //MaterialPageRoute(builder: (context) => ProfileScreenSport(context)),
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
          Container(
            padding: EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0),
            child: StyleSelection(),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0),
            child: TimeSelection(),
          ),
          SizedBox(
            height: 15,
          ),
          CalendarButton(),
          SizedBox(
            height: 15,
          ),
          Container(
              margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white, // Color de fondo del contenedor
                borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
                border: Border.all(
                  color: Colors.grey, // Color del borde
                  width: 1.0, // Ancho del borde
                ),
              ),
              child: Column(
                children: [
                  SwimmastCard(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 10),
                      color: swimmastBlue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('100 Freestyle',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Icon(Icons.access_time),
                              SizedBox(
                                width: 5,
                              ),
                              Text('3.00',
                                  style: const TextStyle(color: Colors.grey))
                            ],
                          )
                        ],
                      )),
                ],
              )),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: buttoncoloryellow,
              borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
              border: Border.all(
                color: buttoncoloryellow, // Color del borde
                width: 2.0, // Ancho del borde
              ),
            ),
            child: Column(
              children: [
                Text('¡Felicidades! Has superado tu tiempo en',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: swimmastRed)),
                Text('100 Kick en 5:00',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: swimmastRed))
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selected: _selectedtab,
        currentIndex: _onItemTapped,
      ),
    );
  }
}

class StyleSelection extends StatefulWidget {
  @override
  _StyleSelectionState createState() => _StyleSelectionState();
}

class _StyleSelectionState extends State<StyleSelection> {
  String title = 'Seleccionar Estilo';
  String style1 = 'Estilo 1';
  String style2 = 'Estilo 2';
  String style3 = 'Estilo 3';
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text(style1),
            value: style1,
          ),
          PopupMenuItem(
            child: Text(style2),
            value: style2,
          ),
          PopupMenuItem(
            child: Text(style3),
            value: style3,
          ),
        ],
        onSelected: (String newStyle) {
          setState(() {
            title = newStyle;
          });
        },
      ),
    );
  }
}

class TimeSelection extends StatefulWidget {
  @override
  _TimeSelectionState createState() => _TimeSelectionState();
}

class _TimeSelectionState extends State<TimeSelection> {
  String title = 'Seleccionar Metraje';
  String time1 = 'Metraje 1';
  String time2 = 'Metraje 2';
  String time3 = 'Metraje 3';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text(time1),
            value: time1,
          ),
          PopupMenuItem(
            child: Text(time2),
            value: time2,
          ),
          PopupMenuItem(
            child: Text(time3),
            value: time3,
          ),
        ],
        onSelected: (String newTime) {
          setState(() {
            title = newTime;
          });
        },
      ),
    );
  }
}
