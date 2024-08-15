
import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/item_selection.dart';
import 'package:swimmast_movil/widgets/history_cards.dart';
import 'package:swimmast_movil/models/styles.dart';
import 'package:swimmast_movil/models/history_times.dart';

class HistoryScreenSport extends StatefulWidget {
  const HistoryScreenSport({super.key});

  @override
  State<HistoryScreenSport> createState() => _HistoryScreenSportState();
}

class _HistoryScreenSportState extends State<HistoryScreenSport> {
  int _selectedtab = 0;

  List<Styles>? styles;
  List<String> name_styles = ['TODO'];
  List<HistoryTimes>? times;
  String filterStyle = 'TODO';
  String filterMeter = 'TODO';

  List<HistoryTimes>? filtered_history_info = [];

  @override
  void initState() {
    super.initState();
    getStyles();
    getHistoryTimes();
  }

   Future<void> getStyles() async {
    try{
      var response = await Dio().get(urlBack + 'style');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        styles = data.map((json) => Styles.fromJson(json)).toList();
        setState(() {}); 
        nameStyles();
      }
    }
    catch (e) {
      if (e is DioException) {
        print('Status Code: ${e.response?.statusCode}');
        print(e);
      }
    }
  }

  Future<void> getHistoryTimes() async {
    try{
      var response = await Dio().get(urlBack + 'session_report/swimmer_id/${idUser}');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        times = data.map((json) => HistoryTimes.fromJson(json)).toList();
        filtered_history_info = times;
        setState(() {});
      }
    }
    catch (e) {
      if (e is DioException) {
        print('Status Code: ${e.response?.statusCode}');
        print(e);
      }
    }
  }

  void nameStyles(){
    if(styles != null){
    name_styles.addAll(styles!.map((style) => style.name).toList()); 
    setState(() {});
    } 
  }

  void updateFilterStyle(String newStyle, String newMeter) {
    setState(() {
      filterStyle = newStyle;
      filterMeter = newMeter;
      if (filterMeter == 'TODO') {
        if (filterStyle == 'TODO') {
          filtered_history_info = times;
        } else {
          filtered_history_info = times!
              .where((item) => item.style.name.toString().contains(filterStyle))
              .toList();
        }
      } else {
        if (filterStyle == 'TODO') {
          filtered_history_info = times!
              .where((item) => item.meters.toString().contains(filterMeter))
              .toList();
        } else {
          filtered_history_info = times!
              .where((item) => item.style.name.toString().contains(filterStyle))
              .where((item) => item.meters.toString().contains(filterMeter))
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
          Card.outlined(
            margin: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
            child: Container(
                child: ItemSelection(
                    title: "Seleccionar Estilo",
                    styles: name_styles,
                    onSelected: (newFilter) =>
                        updateFilterStyle(newFilter, filterMeter)
                )
            ),
          ),
          Card.outlined(
            margin: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
            child: Container(
              child: ItemSelection(
                  title: "Seleccionar Metraje",
                  styles: ['TODO', '50', '100', '200', '400', '800', '1500'],
                  onSelected: (newFilter) =>
                      updateFilterStyle(filterStyle, newFilter)
              )
            ),
          ),
          SizedBox(height: 15),
          if(filtered_history_info != null && filtered_history_info!.length >0)
          Expanded(
              child: ListView.builder(
                  itemCount: filtered_history_info!.length,
                  itemBuilder: (context, index) => HistoryCards(
                        title_style: filtered_history_info![index].meters.replaceAll(".00","").toString() + " " + filtered_history_info![index].style.name.toString(),
                        time: filtered_history_info![index].time.toString(),
                      ))),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
