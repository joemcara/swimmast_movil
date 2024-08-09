import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/screens/sport_Person/profile_screen_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/home_screen_sport.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/item_selection.dart';
import 'package:swimmast_movil/widgets/history_cards.dart';

class HistoryScreenSport extends StatefulWidget {
  const HistoryScreenSport({super.key});

  @override
  State<HistoryScreenSport> createState() => _HistoryScreenSportState();
}

class _HistoryScreenSportState extends State<HistoryScreenSport> {
  int _selectedtab = 0;

  String filterStyle = 'Todo';
  String filterTime = 'Todo';

  List<Map<String, String>> history_info = [
    {'id': '1', 'title': '100 Pecho', 'time': '1:00'},
    {'id': '2', 'title': '200 Mariposa', 'time': '2:00'},
    {'id': '3', 'title': '50 Libre', 'time': '3:00'},
    {'id': '4', 'title': '200 Combinado', 'time': '4:00'},
    {'id': '4', 'title': '400 Libre', 'time': '5:00'},
    {'id': '4', 'title': '200 Espalda', 'time': '6:00'},
  ];

  List<Map<String, String>> filtered_history_info = [];

  @override
  void initState() {
    super.initState();
    filtered_history_info = history_info;
  }

  void updateFilterStyle(String newStyle, String newTime) {
    setState(() {
      filterStyle = newStyle;
      filterTime = newTime;
      if (filterTime == 'Todo') {
        if (filterStyle == 'Todo') {
          filtered_history_info = history_info;
        } else {
          filtered_history_info = history_info
              .where((item) => item['title']!.contains(filterStyle))
              .toList();
        }
      } else {
        if (filterStyle == 'Todo') {
          filtered_history_info = history_info
              .where((item) => item['title']!.contains(filterTime))
              .toList();
        } else {
          filtered_history_info = history_info
              .where((item) => item['title']!.contains(filterStyle))
              .where((item) => item['title']!.contains(filterTime))
              .toList();
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Historial de tiempos",
        back: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Container(
              margin: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
              padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [buttoncoloryellow, buttoncoloryellow],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ItemSelection(
                  title: "Seleccionar Estilo",
                  styles: [
                    'Todo',
                    'Combinado',
                    'Libre',
                    'Pecho',
                    'Mariposa',
                    'Espalda'
                  ],
                  onSelected: (newFilter) =>
                      updateFilterStyle(newFilter, filterTime))),
          Container(
              margin: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
              padding: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [buttoncoloryellow, buttoncoloryellow],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ItemSelection(
                  title: "Seleccionar Metraje",
                  styles: ['Todo', '50', '100', '200', '400', '800', '1500'],
                  onSelected: (newFilter) =>
                      updateFilterStyle(filterStyle, newFilter))),
          SizedBox(height: 15),
          Expanded(
              child: ListView.builder(
                  itemCount: filtered_history_info.length,
                  itemBuilder: (context, index) => HistoryCards(
                        title_style: filtered_history_info[index]['title']!,
                        time: filtered_history_info[index]['time']!,
                      ))),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
