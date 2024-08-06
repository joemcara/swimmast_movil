import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/constants.dart';

class WidgetPerformed extends StatelessWidget {
  const WidgetPerformed({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        Row(
          children: [
            SizedBox(width: 5),
            Container(
              width: 25.0,
              height: 25.0,
              decoration: BoxDecoration(
                color: swimmastGreen,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 10),
            Text('Realizada',
              style: TextStyle(
              fontSize: 20)
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 5),
            Container(
              width: 25.0,
              height: 25.0,
              decoration: BoxDecoration(
                color: swimmastRed,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 10),
            Text('No Realizada',
              style: TextStyle(
              fontSize: 20)
            ),
          ],
        )
      ]
    );
  }
}