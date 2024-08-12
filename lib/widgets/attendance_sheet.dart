import 'package:swimmast_movil/shared/constants.dart';

class AttendanceSheet extends StatefulWidget {
  final String day;
  final String hour;
  final int membersCount;
  final List<Map<String, dynamic>> members;

  const AttendanceSheet(
      {super.key,
      required this.day,
      required this.hour,
      required this.members,
      required this.membersCount});

  @override
  _AttendanceSheetState createState() => _AttendanceSheetState();
}

class _AttendanceSheetState extends State<AttendanceSheet> {
  List<bool> _isCheckedYes = [];
  List<bool> _isCheckedNo = [];

  @override
  void initState() {
    super.initState();
    _isCheckedYes = List<bool>.filled(widget.membersCount, false);
    _isCheckedNo = List<bool>.filled(widget.membersCount, false);
  }

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Asistencia",
                      style: TextStyle(
                        color: defaultGradient[0],
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width - 50,
                  child: Divider(
                      height: 10, color: Color.fromARGB(255, 201, 197, 197)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        Text(
                          widget.day,
                          style: const TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        Text(
                          widget.hour,
                          style: const TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Miembros: ${widget.membersCount}",
                      style: const TextStyle(fontSize: 17),
                    ),
                    const SizedBox(width: 50),
                    const Icon(
                      Icons.email,
                      size: 40,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 150),
                    Text(
                      "Asistió:    ",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      "Si ",
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(width: 30),
                    Text(
                      "No ",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: widget.members.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (_, index) {
                  String name = widget.members[index]['firstName'] +
                      " " +
                      widget.members[index]['lastName'];
                  int age = calculateAge(widget.members[index]['birthdate']);

                  return ContainerList(
                    name,
                    age,
                  );
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 30),
            child: CustomButton(
              text: "Guardar Asistencia",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      surfaceTintColor: Colors.white,
                      content: Container(
                        padding: const EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height / 7.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.info_rounded,
                              color: Colors.green,
                              size: 50,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: const Text(
                                'Se ha registrado la asistencia',
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text(
                            'Aceptar',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget ContainerList(String name, int age) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(20),
    width: 350,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(maxRadius: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text("$age años"),
          ],
        ),
        const CheckboxYes(),
      ],
    ),
  );
}

class CheckboxYes extends StatefulWidget {
  const CheckboxYes({super.key});

  @override
  _CheckboxState createState() => _CheckboxState();
}

class _CheckboxState extends State<CheckboxYes> {
  bool _isChecked = false;
  bool _isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          activeColor: Colors.green,
          shape: const CircleBorder(),
          onChanged: (bool? value) {
            setState(() {
              if (_isChecked2 == false) {
                _isChecked = true;
              } else {
                _isChecked2 = false;
                _isChecked = true;
              }
            });
          },
        ),
        Checkbox(
          value: _isChecked2,
          activeColor: Colors.red,
          shape: const CircleBorder(),
          onChanged: (bool? value) {
            setState(() {
              if (_isChecked == false) {
                _isChecked2 = true;
              } else {
                _isChecked = false;
                _isChecked2 = true;
              }
            });
          },
        ),
      ],
    );
  }
}
