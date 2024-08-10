import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/competitions_cards.dart';

class CompetitionsInfoCards extends StatelessWidget {
  final List<Map<String, String>> competitions_info = [
    {
      'id': '1',
      'name': 'Competicion 1',
      'date': '2024-01-01',
      'time': '9:30-11:00',
      'style': 'Espalda',
      'meters': '50'
    },
    {
      'id': '2',
      'name': 'Competicion 2',
      'date': '2024-01-01',
      'time': '9:30-11:00',
      'style': 'Libre',
      'meters': '50'
    },{
      'id': '3',
      'name': 'Competicion 3',
      'date': '2024-01-01',
      'time': '9:30-11:00',
      'style': 'Pecho',
      'meters': '100'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: competitions_info.length,
            itemBuilder: (context, index) => CompetitionsCards(
                competition_name: competitions_info[index]['name']!,
                date: competitions_info[index]['date']!,
                time: competitions_info[index]['time']!,
                style_name: competitions_info[index]['style']!,
                meters: competitions_info[index]['meters']!,
            )
        )
    );
  }
}
