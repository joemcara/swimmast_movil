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

  int weekday = DateTime.now().weekday;
  String formattedDate =
      '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}';

  @override
  void initState() {
    super.initState();
    _isCheckedYes = List<bool>.filled(widget.membersCount, false);
    _isCheckedNo = List<bool>.filled(widget.membersCount, false);
  }

  Future<void> _RegisterAttendanceFalse() async {
    try {
      List<int> absentIds = [];

      for (var item in attendance) {
        if (item['attendance'] == false) {
          absentIds.add(item['id']);
        }
      }

      Map<String, dynamic> dataAbsent = {
        "swimmers": absentIds,
        "course": courseSelected,
        "weekday": weekday,
        "date": formattedDate,
        "attendance": false
      };

      final responsePresent = await Dio().post(
        urlBack + 'attendance_record/register_attendance/',
        data: dataAbsent,
        options: Options(headers: {'Authorization': 'Token ${token}'}),
      );

      if (responsePresent.statusCode != 201) {
        print('Error registering attendance: ${responsePresent.statusMessage}');
        return;
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _RegisterAttendanceTrue() async {
    try {
      List<int> presentIds = [];

      for (var item in attendance) {
        if (item['attendance'] == true) {
          presentIds.add(item['id']);
        }
      }

      Map<String, dynamic> dataPresent = {
        "swimmers": presentIds,
        "course": courseSelected,
        "weekday": weekday,
        "date": formattedDate,
        "attendance": true
      };

      final responsePresent = await Dio().post(
        urlBack + 'attendance_record/register_attendance/',
        data: dataPresent,
        options: Options(headers: {'Authorization': 'Token ${token}'}),
      );

      if (responsePresent.statusCode != 201) {
        // Handle error
        print('Error registering attendance: ${responsePresent.statusMessage}');
        return;
      }
    } catch (e) {
      print('Error: $e');
    }
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
                    Row(children: [
                      const Icon(Icons.people),
                      Text(
                        "Miembros: ${widget.membersCount}",
                        style: const TextStyle(fontSize: 17),
                      ),
                    ]),
                    const SizedBox(width: 60),
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

                  return ContainerList(
                    name,
                    index,
                    (yesChecked) {
                      setState(() {
                        _isCheckedYes[index] = yesChecked;
                        if (yesChecked) _isCheckedNo[index] = false;
                      });
                    },
                    (noChecked) {
                      setState(() {
                        _isCheckedNo[index] = noChecked;
                        if (noChecked) _isCheckedYes[index] = false;
                      });
                    },
                    _isCheckedYes[index],
                    _isCheckedNo[index],
                  );
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 30),
            child: CustomButton(
              text: "Guardar Asistencia",
              onPressed: () async {
                if (attendanceMap.length != widget.membersCount) {
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
                                Icons.error_outline,
                                color: Colors.red,
                                size: 50,
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: const Text(
                                    'Por favor, marque asistencia para todos los miembros.',
                                    style: TextStyle(fontSize: 16),
                                  ),
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
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  final attendanceData =
                      widget.members.asMap().entries.map((entry) {
                    final index = entry.key;
                    final member = entry.value;
                    return {
                      'id': member['id'],
                      'attendance': attendanceMap[index],
                    };
                  }).toList();

                  attendance = attendanceData;

                  await _RegisterAttendanceFalse();
                  await _RegisterAttendanceTrue();
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
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget ContainerList(
  String name,
  int index,
  Function(bool) onYesChecked,
  Function(bool) onNoChecked,
  bool isCheckedYes,
  bool isCheckedNo,
) {
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
          ],
        ),
        CheckboxYes(
          onYesChecked: (value) {
            onYesChecked(value);
            if (value) {
              attendanceMap[index] = true;
            } else {
              attendanceMap.remove(index);
            }
          },
          onNoChecked: (value) {
            onNoChecked(value);
            if (value) {
              attendanceMap[index] = false;
            } else {
              attendanceMap.remove(index);
            }
          },
          isCheckedYes: isCheckedYes,
          isCheckedNo: isCheckedNo,
        ),
      ],
    ),
  );
}

class CheckboxYes extends StatelessWidget {
  final Function(bool) onYesChecked;
  final Function(bool) onNoChecked;
  final bool isCheckedYes;
  final bool isCheckedNo;

  const CheckboxYes(
      {super.key,
      required this.onYesChecked,
      required this.onNoChecked,
      required this.isCheckedYes,
      required this.isCheckedNo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Colors.green,
          shape: const CircleBorder(),
          value: isCheckedYes,
          onChanged: (value) {
            if (value != null) {
              onYesChecked(value);
            }
          },
        ),
        const SizedBox(width: 30),
        Checkbox(
          value: isCheckedNo,
          shape: const CircleBorder(),
          activeColor: Colors.red,
          onChanged: (value) {
            if (value != null) {
              onNoChecked(value);
            }
          },
        ),
      ],
    );
  }
}
