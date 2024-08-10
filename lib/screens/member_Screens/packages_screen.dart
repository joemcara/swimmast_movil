import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/customCalendar.dart';
import 'package:swimmast_movil/widgets/swimmast_card.dart';
import 'package:swimmast_movil/widgets/swimmast_icon_text.dart';
import 'package:intl/intl.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({super.key});

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  List<Range> _selectedRanges = [];
  List<Widget> _displayedPackages = [];
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es_ES', null).then((_) {
      setState(() {});
    });
    obtainDates();
  }

  void obtainDates() {
    int i = 0;
    for (var item in coursesList) {
      startDate = item['startDate'];
      endDate = item['dueDate'];
      _selectedRanges.add(Range(startDate!, endDate!, colorsList[i]));
      i++;
    }
  }

  List<Map<String, Color>> colors = [];
  DateTime? startDate;
  DateTime? endDate;

  List<Widget> packagesDistribution(DateTime date) {
    List<Widget> courses = [];
    int i = 0;
    for (var item in coursesList) {
      if (isDateInRange(date, item['startDate'], item['dueDate']) &&
          (!_isWeekend(date))) {
        PackageInfo package = PackageInfo(
          color: colorsList[i],
          name: item['name'],
          day: item['day'],
          hour: item['hour'],
        );

        Map<String, Color> colorsDay = {item['name']: colorsList[i]};
        colors.add(colorsDay);
        courses.add(package);
        i++;
      }
    }
    return courses;
  }

  bool isDateInRange(DateTime date, DateTime startDate, DateTime endDate) {
    return date.isAfter(startDate.subtract(Duration(days: 1))) &&
        date.isBefore(endDate.add(Duration(days: 1)));
  }

  bool _isWeekend(DateTime day) {
    return day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
      _displayedPackages = packagesDistribution(date);
    });
    print(date);
  }

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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: CustomCalendar(
                        initialRanges: _selectedRanges,
                        onDateSelected: _onDateSelected,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      children: _displayedPackages,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PackageInfo extends StatelessWidget {
  final Color? color;
  final String? name;
  final String? day;
  final String? hour;

  // Constructor de la clase
  const PackageInfo({
    Key? key,
    this.color,
    this.name,
    this.day,
    this.hour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: SwimmastCard(
        color: color,
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
                  name ?? "Nombre del curso",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SwimmastIconText(
                  text: day ?? "Días",
                  icon: Icon(Icons.calendar_month_outlined),
                ),
                SizedBox(
                  height: 10,
                ),
                SwimmastIconText(
                  text: hour ?? "Hora",
                  icon: Icon(Icons.watch_later_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
