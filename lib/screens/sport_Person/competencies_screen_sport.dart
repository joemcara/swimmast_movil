import 'package:flutter/material.dart';
import 'package:swimmast_movil/widgets/competitions_info_cards.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Competencias Pasadas",
        back: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CompetitionsInfoCards() 
        ],
      )
    );
  }
}
