import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:swimmast_movil/shared/constants.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  static const Map<String, String> classes = {'09:00': "Calentamiento"};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 10, 20),
        child: Column(children: [
          Row(
            children: [
              const Icon(Icons.calendar_month),
              const SizedBox(
                  width: 8), // Añadir espacio entre el icono y el texto
              Text(
                today,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
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
                                color: swimmastBlue),
                            child: const Text(
                              "AGREGAR RUTINA",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: borderColor)),
                              height: 360,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            19, 5, 19, 19),
                                        child: const DropdownMenu(
                                            width: 200,
                                            hintText: "Seleccione estilo",
                                            menuStyle: MenuStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.white)),
                                            inputDecorationTheme:
                                                InputDecorationTheme(
                                                    hoverColor: Colors.cyan),
                                            dropdownMenuEntries: <DropdownMenuEntry<
                                                String>>[
                                              DropdownMenuEntry(
                                                  value: "500 Freestyle",
                                                  label: "500 Freestyle"),
                                              DropdownMenuEntry(
                                                  value: "500 Kick",
                                                  label: "500 Kick"),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 0, 0),
                                          child: (const Text(
                                              "Seleccionar tiempo")),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: Container(
                                              height: 150,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: borderColor)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    width: 50,
                                                    child: SpinBox(
                                                      incrementIcon: const Icon(
                                                          Icons
                                                              .keyboard_arrow_up),
                                                      decrementIcon: const Icon(
                                                          Icons
                                                              .keyboard_arrow_down),
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 12),
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: const Text("min"),
                                                  ),
                                                ],
                                              )),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 0, 0),
                                          child: const Row(children: [
                                            Text("Número de repeticiones"),
                                            SizedBox(width: 5),
                                            SizedBox(
                                              width: 50,
                                              child: TextField(
                                                  decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.zero,
                                                  borderSide: BorderSide(
                                                      color: borderColor),
                                                ),
                                              )),
                                            )
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  child: const Text(
                                    'Cancelar',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text(
                                    'Aceptar',
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
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
            child: generateContainer(classes, context)[0],
          ),
          CustomButton(
            text: "Guardar Rutina",
            onPressed: () => {},
          ),
        ]),
      ),
    );
  }

  List<Widget> generateContainer(Map classes, BuildContext context) {
    List<Widget> containers = [];
    for (var entry in classes.entries) {
      containers.add(Row(children: [
        Expanded(
          flex: 1,
          child: Text(
            entry.key,
            style: styleSubtitles,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 5,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text(entry.value), const Text("15 min")],
              ),
            ),
          ),
        )
      ]));
    }

    return containers;
  }
}
