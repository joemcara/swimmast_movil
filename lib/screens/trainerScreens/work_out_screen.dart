import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swimmast_movil/shared/button.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  onPressed() {}

  static const Map<String, String> classes = {'09:00': "Calentamiento"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          padding: EdgeInsets.only(bottom: 10, top: 15),
          child: SingleChildScrollView(
            child: EasyDateTimeLine(
              initialDate: DateTime.now(),
              activeColor: swimmastBlue,
              headerProps: const EasyHeaderProps(
                monthPickerType: MonthPickerType.switcher,
                dateFormatter: DateFormatter.fullDateDayAsStrMY(),
              ),
            ),
          )),
      const Padding(
        padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Hora",
              style: styleSubtitles,
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              "Rutina",
              style: styleSubtitles,
            ),
            SizedBox(width: 220),
            Icon(
              Icons.more_vert,
              color: swimmastBlue,
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
        child: generateContainer(classes)[0],
      ),
      CustomButton(text: "Agregar Rutina", onPressed: onPressed)
    ]));
  }
}

List<Widget> generateContainer(Map classes) {
  List<Widget> containers = [];
  for (var entry in classes.entries) {
    containers.add(Row(children: [
      Text(
        entry.key,
        style: styleSubtitles,
      ),
      SizedBox(
        width: 20,
      ),
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20)),
        width: 300,
        height: 350,
        child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text(entry.value), Text("15 min")],
            )),
      )
    ]));
  }

  return containers;
}
