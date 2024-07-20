import 'package:swimmast_movil/shared/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({super.key});

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "Paquetes inscritos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Card.outlined(
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      children: [
                        TableCalendar(
                          onDaySelected: (DateTime start, DateTime end) {
                            print(start);
                            print(end);
                          },
                          onRangeSelected: (DateTime? start, DateTime? middle,
                              DateTime end) {},
                          focusedDay: DateTime.now(),
                          firstDay: DateTime(2000),
                          lastDay: DateTime(2025),
                          onFormatChanged: (CalendarFormat format) {
                            setState(() {
                              _calendarFormat = format;
                            });
                          },
                          calendarFormat: _calendarFormat,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            _packageInfo(null, null),
                            _packageInfo(Colors.purpleAccent, null),
                            _packageInfo(Colors.amber, null),
                          ],
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  Widget _packageInfo(Color? color, String? name) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color ?? swimmastBlue),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text("Paquete X . Lunes ${8}:30 - 11:00 am")
        ],
      ),
    );
  }
}
