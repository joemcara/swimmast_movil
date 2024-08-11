import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/routine_cards.dart';
import 'package:swimmast_movil/models/history_routines.dart';

class RoutineInfoCards extends StatefulWidget {
  const RoutineInfoCards({super.key});

  @override
  State<RoutineInfoCards> createState() => _RoutineInfoCardsState();
}

class _RoutineInfoCardsState extends State<RoutineInfoCards> {

  List<HistoryRoutines>? routines;
  
  @override
  void initState() {
    super.initState();
    getRoutines();
  }

  Future<void> getRoutines() async {
    var response = await Dio().get(urlBack + 'routine/swimmer/3');
    
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      routines = data.map((json) => HistoryRoutines.fromJson(json)).toList();
      setState(() {}); 
    }
  }


  @override
  Widget build(BuildContext context) {
    if(routines != null && routines!.length >0)
    return Expanded(
        child: ListView.builder(
            itemCount: routines!.length,
            itemBuilder: (context, index) => RoutineCards(
                routine_name: routines![index].name.toString(),
                day: routines![index].day.toString(),
                time: routines![index].time.toString(),
                color: routines![index].performed
                    ? swimmastGreen
                    : swimmastRed
            )
        )
    );
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sin Rutinas")
          ]
    );
  }
}