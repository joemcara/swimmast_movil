import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/constants.dart';

class WidgetCongratulations extends StatelessWidget {
  final String style;
  final String time;
  
  WidgetCongratulations({required this.style, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(162, 253, 196, 8), 
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Color.fromARGB(255, 233, 6, 6), 
          width: 2.0, 
        ),
      ),
      child: Column(
        children: [
          Text('¡Felicidades! Has superado tu tiempo en',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: swimmastRed)
            ),
            Text('$style en $time',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontWeight: FontWeight.bold,
              color: swimmastRed)
            )
        ],
      )
    );
  }
}