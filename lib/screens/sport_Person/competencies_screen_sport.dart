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

class Competition {
  final String name;
  final String date;
  final String time;
  final String style;
  final String metraje;

  Competition(
      {required this.name,
      required this.date,
      required this.time,
      required this.style,
      required this.metraje});
}

class CompetenciesScreenSport extends StatefulWidget {
  const CompetenciesScreenSport({super.key});

  @override
  State<CompetenciesScreenSport> createState() =>
      _CompetenciesScreenSportState();
}

class _CompetenciesScreenSportState extends State<CompetenciesScreenSport> {
  DateTime _selectedDate = DateTime.now();

  final List<Competition> competitions = [
    Competition(
        name: "Competition 1",
        date: "2023-07-22",
        time: "9:00-11:00",
        style: "style 1",
        metraje: "metraje 1"),
    Competition(
        name: "Competition 2",
        date: "2023-06-15",
        time: "11:00-13:00",
        style: "style 2",
        metraje: "metraje 2"),
    Competition(
        name: "Competition 3",
        date: "2023-05-01",
        time: "14:00-16:00",
        style: "style 1",
        metraje: "metraje 2"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Competencias Pasadas", 
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(            
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: ListView.builder(
                  itemCount: competitions.length,
                  itemBuilder: (_, index) {
                    final competition = competitions[index];
                    return SwimmastCard(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(children: []),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                competition.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SwimmastIconText(
                                text: competition.date,
                                icon: Icon(Icons.calendar_month_outlined),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                competition.style,
                                style: const TextStyle(fontSize: 14),
                              ),
                              const Spacer(),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: SwimmastIconText(
                                  text: competition.time,
                                  icon: Icon(Icons.watch_later_outlined),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  competition.metraje,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
