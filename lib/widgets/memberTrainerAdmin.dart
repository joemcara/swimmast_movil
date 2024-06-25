import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/customableIcon.dart';

class Membertraineradmin extends StatefulWidget {
  const Membertraineradmin({super.key});

  void changeVisibility(bool visibility) {
    visibility = !visibility;
  }

  @override
  MemberAdminState createState() => MemberAdminState();
}

class MemberAdminState extends State<Membertraineradmin> {
  @override
  bool visibilityColumn = false;

  List<Widget> generateContainers(int count) {
    List<Widget> containers = [];
    for (int i = 0; i < count; i++) {
      containers.add(
        Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const Text("500 FreeStyle"),
                const SizedBox(
                  width: 170,
                ),
                Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: const Color.fromARGB(255, 245, 239, 239)),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Text(
                      "5:03",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: swimmastBlue),
                    ))
              ],
            )),
      );
    }
    return containers;
  }

  Widget generateBestTimes(int registerAmount) {
    Column bestTimes = Column(
      children: generateContainers(registerAmount),
    );

    return bestTimes;
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      GestureDetector(
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Mejores tiempos",
              style: styleSubtitles,
            ),
            CustomableIcon(
              icon1: Icons.arrow_drop_down,
              icon2: Icons.arrow_drop_up,
            ),
            SizedBox(
              width: 160,
            ),
          ],
        ),
        onTap: () {
          setState(() {
            visibilityColumn = !visibilityColumn;
          });
        },
      ),
      Column(
        children: [
          Visibility(
              visible: visibilityColumn,
              child: Column(
                children: [generateBestTimes(3)],
              ))
        ],
      )
    ]);
  }
}
