import 'package:flutter/material.dart';

class HomeScreenMember extends StatelessWidget {
  const HomeScreenMember({super.key});
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;

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
    ];
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Column(
          children: [
            const Text(
              "Horarios",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: scheduleList.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (_, index) => _scheduleBox(
                    scheduleList[index]['day'],
                    scheduleList[index]['hour']!,
                    scheduleList[index]['trainer']!,
                    scheduleList[index]["image_url"],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _scheduleBox(
  String? day,
  String? hour,
  String? trainer,
  String? imageUrl,
) {
  return GestureDetector(
    onTap: () {},
    child: Card.outlined(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
            children: [
              Image.asset(
                imageUrl ?? "lib/assets/swimmast_logo.png",
                height: 150,
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
                            fontSize: 16,
                            height: 2,
                            fontWeight: FontWeight.bold),
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
                            fontSize: 16,
                            height: 2,
                            fontWeight: FontWeight.bold),
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
                            fontSize: 16,
                            height: 2,
                            fontWeight: FontWeight.bold),
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
        )),
  );
}
