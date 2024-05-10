import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/button.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/custom_date_dropdown.dart';
import 'package:swimmast_movil/shared/swimmast_tabs.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScrenState();
}

class _HistoryScrenState extends State<HistoryScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    const List<String> tabs = ["Horarios", "Sesiones"];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: const PreferredSize(
              preferredSize: Size(double.infinity, 10),
              child: SwimmastTabs(
                tabNames: tabs,
              ),
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
                  {"name": "500 Freestyle", "time": "5:09"}
                ])
              ],
            ),
            Column(
              children: [
                CustomTextButton(text: "Paquetes inscritos", onPressed: () {}),
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (_, index) {
            return Card.outlined(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Entrenador/a: Pedro",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.red),
                            child: Image.asset(
                              "lib/assets/swim.png",
                              height: 100,
                              width: 80,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_month_outlined),
                              Text("Lunes")
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.watch_later_outlined),
                              Text("9:30 - 11:00")
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ));
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
            padding: const EdgeInsets.all(6),
            itemBuilder: (_, index) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 16,
                            height: 80,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                color: system_blue),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.watch_later_outlined,
                                    size: 16,
                                  ),
                                  Text(sessions[index]["time"] ?? "")
                                  // Text("5:09")
                                ],
                              )
                            ],
                          )
                        ],
                      )),
                )),
      ),
    );
  }
}
