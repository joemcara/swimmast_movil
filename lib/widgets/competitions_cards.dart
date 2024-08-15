import 'package:flutter/material.dart';
import 'package:swimmast_movil/widgets/swimmast_card.dart';
import 'package:swimmast_movil/shared/constants.dart';

class CompetitionsCards extends StatelessWidget {
  final String competition_name;
  final String date;
  final String time;
  final String style_name;
  final String meters;

  CompetitionsCards({required this.competition_name, required this.date, required this.time, required this.style_name, required this.meters});

  @override
  Widget build(BuildContext context) {
    return SwimmastCard(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      color: swimmastBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(competition_name,
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20)
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20),
                Row(
                  children:[
                    Icon(Icons.calendar_month),
                    SizedBox(width: 5),
                    Text(date, style: const TextStyle(color: Colors.grey))
                  ]
                ),
                SizedBox(width: 50),
                Row(
                  children:[
                    Icon(Icons.access_time),
                    SizedBox(width: 5),
                    Text(time, style: const TextStyle(color: Colors.grey))
                  ]
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 22),
                Row(
                  children:[
                    Text("Estilo:", style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                    SizedBox(width: 5),
                    Text(style_name, style: const TextStyle(color: Colors.grey))
                  ]
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 22),
                Row(
                  children:[
                    Text("Metros:", style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
                    SizedBox(width: 5),
                    Text(meters, style: const TextStyle(color: Colors.grey))
                  ]
                ),
              ],
            )
        ],
      )
    );
  }
}