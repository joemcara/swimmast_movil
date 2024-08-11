import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/competitions_cards.dart';
import 'package:swimmast_movil/models/competitions_info.dart';

class CompetitionsInfoCards extends StatefulWidget {
  const CompetitionsInfoCards({super.key});

  @override
  State<CompetitionsInfoCards> createState() => _CompetitionsInfoCardsState();
}

class _CompetitionsInfoCardsState extends State<CompetitionsInfoCards> {

  List<CompetitionsInfo>? competitions;
  
  @override
  void initState() {
    super.initState();
    getCompetitions();
  }

  Future<void> getCompetitions() async {
    try{
      var response = await Dio().get(urlBack + 'competition_report/swimmer/3'); 
      if (response.statusCode == 201) {
        List<dynamic> data = response.data;
        competitions = data.map((json) => CompetitionsInfo.fromJson(json)).toList();
        setState(() {}); 
      }
    }
    catch (e) {
      if (e is DioException) {
        print('Status Code: ${e.response?.statusCode}');
        print('Data: ${e.response?.data}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if(competitions != null && competitions!.length >0)
    return Expanded(
        child: ListView.builder(
            itemCount: competitions!.length,
            itemBuilder: (context, index) => CompetitionsCards(
                competition_name: competitions![index].competition.name.toString(),
                date: competitions![index].date.year.toString() + "-" + competitions![index].date.month.toString() + "-" + competitions![index].date.day.toString(),
                time: competitions![index].competition.time.toString(),
                style_name: competitions![index].competition.style.name.toString(),
                meters: competitions![index].competition.meters.replaceAll(".00","").toString(),
            )
        )
    );
    return Center(
      child: Text("Sin Competencias")
    ); /*Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sin Competencias")
          ]
    );*/
  }
}