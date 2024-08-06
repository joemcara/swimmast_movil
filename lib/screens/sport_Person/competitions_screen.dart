import 'package:flutter/material.dart';
import 'package:swimmast_movil/widgets/swimmast_card.dart';
import 'package:swimmast_movil/shared/constants.dart';

class CompetitionsScreen extends StatelessWidget {
  const CompetitionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.emoji_events,
              size: 90,
              color: Color.fromRGBO(244, 195, 20, 100)
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                    Text('Competencias',
                      style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Color.fromRGBO(244, 195, 20, 100))
                    ),
                Text('Pasadas',
                      style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Color.fromRGBO(244, 195, 20, 100))
                    ),
              ],
            )
          ],
        ),
        SizedBox(
            height: 15,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white, // Color de fondo del contenedor
            borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
            border: Border.all(
              color: Colors.grey, // Color del borde
              width: 1.0, // Ancho del borde
            )
          ),
          child: Column(
            children: [
              SwimmastCard(
                            height: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                            color: swimmastBlue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text('Competencia 1',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Icon(Icons.calendar_month),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('Lunes', style: const TextStyle(color: Colors.grey)),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Icon(Icons.access_time),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('9:30-11:00', style: const TextStyle(color: Colors.grey))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text('Estilo: ', style: const TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text('Metraje: ', style: const TextStyle(color: Colors.grey)),
                                    ],
                                  )
                              ],
                            )
                          ),
              SizedBox(
                height: 10,
              ),
              SwimmastCard(
                            height: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                            color: swimmastRed,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text('Competencia 2',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Icon(Icons.calendar_month),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('Lunes', style: const TextStyle(color: Colors.grey)),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Icon(Icons.access_time),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('9:30-11:00', style: const TextStyle(color: Colors.grey))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text('Estilo: ', style: const TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text('Metraje: ', style: const TextStyle(color: Colors.grey)),
                                    ],
                                  )
                              ],
                            )
                          ), 
              SizedBox(
                height: 10,
              ),
              SwimmastCard(
                            height: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                            color: swimmastGreen,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text('Competencia 3',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Icon(Icons.calendar_month),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('Lunes', style: const TextStyle(color: Colors.grey)),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Icon(Icons.access_time),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('9:30-11:00', style: const TextStyle(color: Colors.grey))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text('Estilo: ', style: const TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text('Metraje: ', style: const TextStyle(color: Colors.grey)),
                                    ],
                                  )
                              ],
                            )
                          ),           
            ],
          )
        )
      ],
    );
  }
}