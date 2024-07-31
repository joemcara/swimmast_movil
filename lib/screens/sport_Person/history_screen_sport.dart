import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/swimmast_tabs.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/screens/sport_Person/calendar_button.dart';
import 'package:swimmast_movil/screens/sport_Person/item_selection.dart';
import 'package:swimmast_movil/screens/sport_Person/history_info_cards.dart';
import 'package:swimmast_movil/screens/sport_Person/widget_congratulations.dart';
import 'package:swimmast_movil/screens/sport_Person/routine_info_cards.dart';
import 'package:swimmast_movil/screens/sport_Person/widget_performed.dart';

class HistoryScreenSport extends StatelessWidget {
  const HistoryScreenSport({super.key});

   @override
  Widget build(BuildContext context) {
    const List<String> tabNames = ["Historial", "Sesiones"];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: const PreferredSize(
              preferredSize: Size(double.infinity, 10),
              child: SwimmastTabs(
                tabNames: tabNames
                ),
            ),
          ),
          body: TabBarView(
            children: [
              Column(
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
                  WidgetCongratulations(style: "title_style", time: "time")
                ]
              ),
              Column(
                children: [
                  SizedBox(height: 20),
                  WidgetPerformed(),
                  SizedBox(height: 40),
                  RoutineInfoCards()
                ],
              )
            ]
          )
        )
    );
  }
}

