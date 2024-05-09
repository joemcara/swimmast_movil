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
                _schedule(sessions: [
                  {"name": "500 Freestyle", "time": "5:09"}
                ])
              ],
            ),
            Container(
              width: 20,
            )
          ])),
    );
  }
}

class _schedule extends StatelessWidget {
  final List<Map<String, String>> sessions;
  const _schedule({
    super.key,
    required this.sessions,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20)),
        child: ListView.builder(
            itemCount: sessions.length,
            padding: const EdgeInsets.all(6),
            itemBuilder: (_, index) => Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Text(sessions[index]["name"] ?? ""),
                    subtitle: Text(sessions[index]["time"] ?? ""),
                  ),
                )),
      ),
    );
  }
}
