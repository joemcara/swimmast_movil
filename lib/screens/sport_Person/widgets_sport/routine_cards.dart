import 'package:flutter/material.dart';
import 'package:swimmast_movil/widgets/swimmast_card.dart';
import 'package:swimmast_movil/shared/constants.dart';

class RoutineCards extends StatelessWidget {
  final String routine_name;
  final String day;
  final String time;
  final Color color;

  RoutineCards({required this.routine_name, required this.day, required this.time, required this.color});

  @override
  Widget build(BuildContext context) {
    return SwimmastCard(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(routine_name,
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20)
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.calendar_month),
                SizedBox(width: 5),
                Text(day, style: const TextStyle(color: Colors.grey))
              ],
            ),
            SizedBox(height: 7),
            Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.access_time),
                SizedBox(width: 5),
                Text(time, style: const TextStyle(color: Colors.grey))
              ],
            )
        ],
      )
    );
  }
}