
import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/profile_header.dart';

class HomeScreenMember extends StatelessWidget {
  const HomeScreenMember({super.key});
  @override
  Widget build(BuildContext context) {
    const List<Map<String, String>> scheduleList = [
      {
        "day": "Lunes",
        "hour": "9:30",
        "trainer": "Pedro",
        "image_url": "lib/assets/swim.png"
      },
      {
        "day": "Martes",
        "hour": "10:30",
        "trainer": "Pedro",
        "image_url": "lib/assets/swimmast_logo.png"
      },
      {
        "day": "Martes",
        "hour": "10:30",
        "trainer": "Pedro",
        "image_url": "lib/assets/swimmast_logo.png"
      },
    ];
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          const ProfileHeader(username: "Evelyn Smith"),
          const Text(
            "Horarios",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: _createScheduleBoxes(scheduleList),
            ),
          )
        ],
      ),
    ));
  }
}

List<Widget> _createScheduleBoxes(List<Map<String, String>> scheduleList) {
  return scheduleList
      .map((e) =>
          _scheduleBox(e["day"], e["hour"], e["trainer"], e["image_url"]))
      .toList();
}

Widget _scheduleBox(
  String? day,
  String? hour,
  String? trainer,
  String? imageUrl,
) {
  return Container(
    height: 150,
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
        border: Border.all(), borderRadius: BorderRadius.circular(5)),
    child: Row(
      children: [
        Image.asset(
          imageUrl ?? "lib/assets/swimmast_logo.png",
          height: 200,
          width: 100,
          fit: BoxFit.fitHeight,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Día: ",
                  style: TextStyle(
                      fontSize: 16, height: 2, fontWeight: FontWeight.bold),
                ),
                Text(
                  day ?? "no disponible",
                  style: const TextStyle(fontSize: 16, height: 2),
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  "Hora: ",
                  style: TextStyle(
                      fontSize: 16, height: 2, fontWeight: FontWeight.bold),
                ),
                Text(
                  hour ?? "no disponible",
                  style: const TextStyle(fontSize: 16, height: 2),
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  "Entrenador/a: ",
                  style: TextStyle(
                      fontSize: 16, height: 2, fontWeight: FontWeight.bold),
                ),
                Text(
                  trainer ?? "no disponible",
                  style: const TextStyle(fontSize: 16, height: 2),
                )
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
