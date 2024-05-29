import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/trainerScreens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/shared/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainScreenTraineeState parentState =
        context.findAncestorStateOfType<MainScreenTraineeState>()!;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Horarios asignados",
                style: styleTitles,
              )
            ],
          ),
          const SizedBox(height: 15),
          Flexible(
            child: classesCard(
              state: parentState,
            ),
          )
        ],
      ),
    );
  }
}

class classesCard extends StatelessWidget {
  MainScreenTraineeState state;

  classesCard({super.key, required this.state});

  List<Widget> generateContainers(int count, BuildContext context) {
    List<Widget> containers = [];
    for (int i = 0; i < count; i++) {
      containers.add(Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 226, 219, 219)),
            color: Colors.white),
        width: 330,
        height: 200,
        child: Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Lunes y Miércoles",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 211, 202, 202)
                              .withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    width: 60,
                    child: const Text(
                      "9:30",
                    ),
                  ),
                  onTap: () {
                    attendanceStateModal = true;
                    state.changeSelected();
                  },
                )
              ],
            )),
      ));
    }
    return containers;
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Builder(builder: (BuildContext context) {
        return Column(children: generateContainers(3, context));
      }),
    );
  }
}
