import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/button.dart';
import 'package:swimmast_movil/shared/button.dart';

class AttendanceScreen extends StatelessWidget {
  final String day = "Lunes, 25 de febrero";
  final String hour = "8:00 AM";
  final String members = "10";
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressed() {}

    return Scaffold(
        body: Column(children: [
      const SizedBox(
        height: 20,
      ),
      Container(
        decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey),
              right: BorderSide(color: Colors.grey),
              left: BorderSide(color: Colors.grey),
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Asistencia",
                  style: TextStyle(
                      color: swimmastBlue,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    Text(
                      day,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(width: 100),
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    Text(hour, style: const TextStyle(fontSize: 17))
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Miembros", style: TextStyle(fontSize: 17)),
                const SizedBox(width: 50),
                Text("Total: " + '${members}',
                    style: const TextStyle(fontSize: 17)),
                const SizedBox(width: 50),
                const Icon(
                  Icons.email,
                  size: 40,
                )
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 150),
                Text("Asistió:    ", style: TextStyle(fontSize: 17)),
                Text("Si ", style: TextStyle(fontSize: 17)),
                SizedBox(width: 30),
                Text("No ", style: TextStyle(fontSize: 17))
              ],
            ),
          ],
        ),
      ),
      Flexible(
        child: ContainerList(),
      ),
      CustomButton(text: "Guardar Asistencia", onPressed: onPressed)
    ]));
  }
}

class ContainerList extends StatelessWidget {
  List<String> students = [
    "Evelyn Smith",
    "Emily Atkison",
    "Olver Wilson",
    "Isaías Nolivos",
    "María Peralta"
  ];

  List<Widget> generateContainers(int count) {
    List<Widget> containers = [];
    for (int i = 0; i < count; i++) {
      containers.add(
        Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            width: 350,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(maxRadius: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      students[i],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const Text("12 años"),
                  ],
                ),
                CheckboxYes()
              ],
            )),
      );
    }
    return containers;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: generateContainers(5),
      ),
    );
  }
}

class CheckboxYes extends StatefulWidget {
  @override
  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<CheckboxYes> {
  bool _isChecked = false;
  bool _isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Checkbox(
        value: _isChecked,
        activeColor: Colors.green,
        shape: CircleBorder(),
        onChanged: (bool? value) {
          setState(() {
            if (_isChecked2 == false) {
              _isChecked = true;
            } else {
              _isChecked2 = false;
              _isChecked = true;
            }
          });
        },
      ),
      Checkbox(
        value: _isChecked2,
        activeColor: Colors.red,
        shape: CircleBorder(),
        onChanged: (bool? value) {
          setState(() {
            if (_isChecked == false) {
              _isChecked2 = true;
            } else {
              _isChecked = false;
              _isChecked2 = true;
            }
          });
        },
      ),
    ]);
  }
}
