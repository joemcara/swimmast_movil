import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:popover/popover.dart';

class PopoverButton extends StatelessWidget {
  const PopoverButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Icon(
        Icons.more_vert,
        color: swimmastBlue,
      ),
      onTap: () {
        showPopover(
          context: context,
          bodyBuilder: (context) => const ListItems(),
          direction: PopoverDirection.bottom,
          width: 150,
          arrowHeight: 0,
          height: 50,
          barrierDismissible: true,
        );
      },
    );
  }
}

class ListItems extends StatefulWidget {
  const ListItems({super.key});

  @override
  ListItemsState createState() => ListItemsState();
}

class ListItemsState extends State<ListItems> {
  String? selectedItem = "none";
  int currentValue = 1;

  _handleValueChanged(int value) {
    currentValue = value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.zero,
      ),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
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
                          "AGREGAR TIEMPO",
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
                          height: 320,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(19),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: (const Text("Seleccionar tiempo")),
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Container(
                                        height: 180,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: borderColor)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 50,
                                              height: 250,
                                              child: SpinBox(
                                                incrementIcon: const Icon(
                                                    Icons.keyboard_arrow_up),
                                                decrementIcon: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                textStyle: const TextStyle(
                                                    fontSize: 12),
                                                direction: Axis.vertical,
                                                spacing: 5,
                                                min: 1,
                                                max: 100,
                                                value: 10,
                                                onChanged: (value) =>
                                                    print(value),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              child: const Text(":"),
                                            ),
                                            SizedBox(
                                              width: 50,
                                              height: 250,
                                              child: SpinBox(
                                                incrementIcon: const Icon(
                                                    Icons.keyboard_arrow_up),
                                                decrementIcon: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                textStyle: const TextStyle(
                                                    fontSize: 12),
                                                direction: Axis.vertical,
                                                spacing: 5,
                                                min: 1,
                                                max: 60,
                                                value: 10,
                                                onChanged: (value) =>
                                                    print(value),
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              child: const Text("seg"),
                                            ),
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
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
                  });
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.zero,
              ),
              height: 25,
              child: const Center(
                  child: Text(
                'Agregar Tiempo',
                style: TextStyle(fontSize: 15),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
