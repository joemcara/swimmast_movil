import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/routine_cards.dart';

class RoutineInfoCards extends StatelessWidget {
  final List<Map<String, String>> routine_info = [
    {
      'id': '1',
      'name': 'Rutina 1',
      'day': 'Lunes',
      'time': '9:30-11:00',
      'performed': 'yes'
    },
    {
      'id': '1',
      'name': 'Rutina 2',
      'day': 'Martes',
      'time': '9:30-11:00',
      'performed': 'yes'
    },
    {
      'id': '1',
      'name': 'Rutina 3',
      'day': 'Miercoles',
      'time': '9:30-11:00',
      'performed': 'no'
    },
    {
      'id': '1',
      'name': 'Rutina 4',
      'day': 'Jueves',
      'time': '9:30-11:00',
      'performed': 'yes'
    },
    {
      'id': '1',
      'name': 'Rutina 5',
      'day': 'Viernes',
      'time': '9:30-11:00',
      'performed': 'no'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: routine_info.length,
            itemBuilder: (context, index) => RoutineCards(
                routine_name: routine_info[index]['name']!,
                day: routine_info[index]['day']!,
                time: routine_info[index]['time']!,
                color: routine_info[index]['performed'] == 'yes'
                    ? swimmastGreen
                    : swimmastRed)));
  }
}
