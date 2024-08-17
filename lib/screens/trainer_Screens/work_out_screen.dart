import 'dart:ffi';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:get/get.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:flutter/material.dart'; // Asegúrate de importar esto

class WorkoutScreen extends StatefulWidget {
  WorkoutScreen({super.key});

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  Map<String, List<dynamic>> classes = {};

  String formattedDate =
      '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}';

  String? selectedStyle;
  String? selectedDistance;
  int repetitions = 0;

  Future<void> _createRoutine() async {
    try {
      List<Map<String, dynamic>> routine = classes.entries.map((entry) {
        return {
          'style': entry.value[0],
          'meters': entry.value[1],
          'reps': entry.value[2],
        };
      }).toList();

      Map<String, dynamic> dataRoutine = {
        "course_id": courseSelected,
        "date": formattedDate,
        "styles": routine
      };

      final responsePresent = await Dio().post(
        urlBack + 'attendance_record/register_attendance/',
        data: dataRoutine,
        options: Options(headers: {'Authorization': 'Token ${token}'}),
      );

      if (responsePresent.statusCode == 201) {
        // Show success alert dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              surfaceTintColor: Colors.white,
              content: Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 7.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 50,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text(
                          'Por favor, marque asistencia para todos los miembros.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'Aceptar',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        print('Error registering routine: ${responsePresent.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Agregar Rutina",
        back: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 50, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_month),
                const SizedBox(width: 8),
                Text(
                  today,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Hora",
                      style: styleSubtitles,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Rutina",
                      style: styleSubtitles,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    onPressed: () {
                      showDialog(
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
                                color: defaultGradient[0],
                              ),
                              child: const Text(
                                "AGREGAR RUTINA",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: borderColor),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          19, 5, 19, 19),
                                      child: DropdownMenu(
                                        width: 200,
                                        hintText: "Seleccione estilo",
                                        menuStyle: MenuStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white),
                                        ),
                                        inputDecorationTheme:
                                            InputDecorationTheme(
                                          hoverColor: Colors.cyan,
                                        ),
                                        dropdownMenuEntries: <DropdownMenuEntry<
                                            String>>[
                                          DropdownMenuEntry(
                                              value: "LIBRE", label: "Libre"),
                                          DropdownMenuEntry(
                                              value: "ESPALDA",
                                              label: "Espalda"),
                                          DropdownMenuEntry(
                                              value: "MARIPOSA",
                                              label: "Mariposa"),
                                        ],
                                        onSelected: (value) {
                                          setState(() {
                                            selectedStyle = value;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          19, 5, 19, 19),
                                      child: DropdownMenu(
                                        width: 200,
                                        hintText: "Seleccione metraje",
                                        menuStyle: MenuStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white),
                                        ),
                                        inputDecorationTheme:
                                            InputDecorationTheme(
                                          hoverColor: Colors.cyan,
                                        ),
                                        dropdownMenuEntries: <DropdownMenuEntry<
                                            String>>[
                                          DropdownMenuEntry(
                                              value: "25", label: "25 metros"),
                                          DropdownMenuEntry(
                                              value: "50", label: "50 metros"),
                                          DropdownMenuEntry(
                                              value: "100",
                                              label: "100 metros"),
                                          DropdownMenuEntry(
                                              value: "200",
                                              label: "200 metros"),
                                        ],
                                        onSelected: (value) {
                                          setState(() {
                                            selectedDistance = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 15, 0, 0),
                                      child: Row(
                                        children: [
                                          const Text("Número de repeticiones"),
                                          const SizedBox(width: 5),
                                          SizedBox(
                                            width: 50,
                                            child: TextField(
                                                onChanged: (value) {
                                                  setState(() {
                                                    repetitions =
                                                        int.tryParse(value) ??
                                                            0;
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.zero,
                                                    borderSide: BorderSide(
                                                        color: borderColor),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    child: const Text('Cancelar',
                                        style: TextStyle(fontSize: 15)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Aceptar',
                                        style: TextStyle(fontSize: 15)),
                                    onPressed: () {
                                      if (selectedStyle != null &&
                                          selectedDistance != null &&
                                          repetitions > 0) {
                                        setState(() {
                                          int key = classes.length;
                                          print(key);
                                          classes[key.toString()] = [
                                            selectedStyle,
                                            int.parse(selectedDistance!),
                                            repetitions
                                          ];
                                        });
                                      }
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 5, left: 20, right: 20, bottom: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            courseSelectedHour,
                            style: styleSubtitles,
                          ),
                          Text(
                            courseSelectedHourEnd,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                        itemCount: classes.length,
                        itemBuilder: (context, index) {
                          dynamic key = classes.keys.elementAt(index);
                          final style = classes[key]![0];
                          final distance = classes[key]![1];
                          final reps = classes[key]![2];

                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: defaultGradient[0],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  style,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  '$distance meters',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '$reps reps',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                    child: CustomButton(
                  text: "Guardar Rutina",
                  onPressed: () => {},
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
