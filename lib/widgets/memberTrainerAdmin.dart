import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swimmast_movil/shared/button.dart';
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
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Text("500 FreeStyle"),
                SizedBox(
                  width: 170,
                ),
                Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Color.fromARGB(255, 245, 239, 239)),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 3),
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
