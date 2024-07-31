import 'package:flutter/material.dart';
import 'package:swimmast_movil/widgets/swimmast_card.dart';
import 'package:swimmast_movil/shared/constants.dart';

class HistoryCards extends StatelessWidget {
  final String title_style;
  final String time;

  HistoryCards({required this.title_style, required this.time});

  @override
  Widget build(BuildContext context) {
    return SwimmastCard(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        color: swimmastBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title_style,
              style: TextStyle(
              fontWeight: FontWeight.bold)
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Icon(Icons.access_time),
                SizedBox(
                  width: 5,
                ),
                Text(time, 
                  style: const TextStyle(color: Colors.grey)
                )
              ],
            )
          ],
        )
    );
  }
}