import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/sport_Person/widgets_sport/history_cards.dart';

class HistoryInfoCards extends StatelessWidget {
  final List<Map<String, String>> history_info = [
    {'id': '1', 'title': '100 Kick', 'time': '1:00'},
    {'id': '2', 'title': '200 Kick', 'time': '2:00'},
    {'id': '3', 'title': '500 Freestyle', 'time': '3:00'},
    {'id': '4', 'title': '100 Butterfly', 'time': '4:00'},
    {'id': '4', 'title': '300 Butterfly', 'time': '5:00'},
    {'id': '4', 'title': '100 Free', 'time': '6:00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: history_info.length,
        itemBuilder: (context, index) => HistoryCards(
          title_style: history_info[index]['title']!,
          time: history_info[index]['time']!,
        )
      )
    );
  }
}