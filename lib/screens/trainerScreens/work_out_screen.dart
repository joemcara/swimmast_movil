import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:swimmast_movil/shared/button.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/inputs.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  static const Map<String, String> classes = {'09:00': "Calentamiento"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          padding: const EdgeInsets.only(bottom: 10, top: 15),
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
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
        child: generateContainer(classes)[0],
      ),
      CustomButton(
          text: "Agregar Rutina",
          onPressed: () {
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 24.0),
                    title: Container(
                      width: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: borderColor),
                          color: swimmastBlue),
                      child: const Text(
                        "AGREGAR RUTINA",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ),
                    content: Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: borderColor)),
                      height: 360,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(19, 5, 19, 19),
                                child: const DropdownMenu(
                                    width: 200,
                                    hintText: "Seleccione estilo",
                                    menuStyle: MenuStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.white)),
                                    inputDecorationTheme: InputDecorationTheme(
                                        hoverColor: Colors.cyan),
                                    dropdownMenuEntries: <DropdownMenuEntry<
                                        String>>[
                                      DropdownMenuEntry(
                                          value: "500 Freestyle",
                                          label: "500 Freestyle"),
                                      DropdownMenuEntry(
                                          value: "500 Kick", label: "500 Kick"),
                                      DropdownMenuEntry(
                                          value: "500 Freestyle",
                                          label: "500 Freestyle"),
                                      DropdownMenuEntry(
                                          value: "500 Freestyle",
                                          label: "500 Freestyle")
                                    ])),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  child: (const Text("Seleccionar tiempo")),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: borderColor)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 50,
                                            child: SpinBox(
                                              incrementIcon: const Icon(
                                                  Icons.keyboard_arrow_up),
                                              decrementIcon: const Icon(
                                                  Icons.keyboard_arrow_down),
                                              textStyle:
                                                  const TextStyle(fontSize: 12),
                                              direction: Axis.vertical,
                                              spacing: 0,
                                              min: 1,
                                              max: 100,
                                              value: 5,
                                              onChanged: (value) =>
                                                  print(value),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            child: const Text("min"),
                                          ),
                                        ],
                                      )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: const Row(children: [
                                    Text("Número de repeticiones"),
                                    SizedBox(width: 5),
                                    SizedBox(
                                      width: 50,
                                      child: TextField(
                                          decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: borderColor),
                                        ),
                                      )),
                                    )
                                  ]),
                                ),
                              ],
                            ),
                          ]),
                    ),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            child: const Text(
                              'Aceptar',
                              style: TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'Cancelar',
                              style: TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      )
                    ],
                  );
                });
          })
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
      const SizedBox(
        width: 20,
      ),
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
        ),
        width: 300,
        height: 350,
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text(entry.value), const Text("15 min")],
            )),
      )
    ]));
  }

  return containers;
}
