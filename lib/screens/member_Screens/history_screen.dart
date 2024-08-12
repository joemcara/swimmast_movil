import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/member_Screens/packages_screen.dart';
import 'package:swimmast_movil/shared/button.dart';
import 'package:swimmast_movil/shared/custom_date_dropdown.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/widgets/swimmast_card.dart';
import 'package:swimmast_movil/widgets/swimmast_icon_text.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScrenState();
}

class _HistoryScrenState extends State<HistoryScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    const List<String> tabs = ["Historial", "Sesiones"];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: CustomAppBar(
            title: "Historial",
            back: true,
            bottom: TabBar(
            tabs: [
              Tab(text: "Paquetes Disponibles"),
              Tab(text: "Comprados"),
            ],
            labelColor: Color.fromARGB(
                255, 240, 204, 0), // Color del texto de la pestaña seleccionada
            unselectedLabelColor: const Color.fromARGB(255, 255, 255,
                255), // Color del texto de las pestañas no seleccionadas
            indicatorColor: Color.fromARGB(255, 240, 204,
                0), // Color de la línea de la pestaña seleccionada
            indicatorWeight: 3.0, // Grosor de la línea del indicador
          ),
          ),
          body: TabBarView(children: [
            Column(
              children: [
                CustomDatePicker(
                  onSelected: (value) {
                    setState(() {
                      if (value != null) {
                        _selectedDate = value;
                      }
                    });
                  },
                ),
                const Schedule(sessions: [
                  {"name": "500 Freestyle", "time": "5:09"},
                  {"name": "500 Freestyle", "time": "5:09"},
                  {"name": "500 Freestyle", "time": "5:09"},
                ])
              ],
            ),
            Column(
              children: [
                CustomTextButton(
                    text: "Paquetes inscritos",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PackageScreen()));
                    }),
                const Session(),
              ],
            )
          ])),
    );
  }
}

class Session extends StatelessWidget {
  const Session({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card.outlined(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (_, index) {
            return const SwimmastCard(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(children: []),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nombre de rutina 1",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SwimmastIconText(
                        text: "Lunes",
                        icon: Icon(Icons.calendar_month_outlined),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SwimmastIconText(
                        text: "9:30 - 11:00",
                        icon: Icon(Icons.watch_later_outlined),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}

class Schedule extends StatelessWidget {
  final List<Map<String, String>> sessions;
  const Schedule({
    super.key,
    required this.sessions,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: ListView.builder(
            itemCount: sessions.length,
            itemBuilder: (_, index) => SwimmastCard(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sessions[index]["name"] ?? "",
                      // "500 Freestyle",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SwimmastIconText(
                      text: sessions[index]["time"] ?? "",
                      icon: const Icon(
                        Icons.watch_later_outlined,
                        size: 16,
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
