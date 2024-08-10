import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:popover/popover.dart';
import 'package:swimmast_movil/screens/sport_Person/profile_screen.dart';
import 'package:swimmast_movil/screens/trainer_Screens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/attendance_sheet.dart';
import 'package:swimmast_movil/models/member.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart' as intl_local_date_data;
import 'package:swimmast_movil/shared/profile_header_trainee.dart';
import 'package:swimmast_movil/widgets/popover.dart';

class AttendanceScreen extends StatefulWidget {
  AttendanceScreen({super.key});

  @override
  AttendanceScreenState createState() => AttendanceScreenState();
}

class AttendanceScreenState extends State<AttendanceScreen> {
  List<Map<String, dynamic>> membersList = [];
  String day = "Today";
  String hour = "00:00";
  @override
  void initState() {
    super.initState();

    /*if (attendanceStateModal == true) {
      _MembersByCourse();
    }*/

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileHeaderState =
          context.findAncestorStateOfType<ProfileHeaderTraineeState>();
      if (profileHeaderState != null) {
        profileHeaderState.updateMessage('Cursos');
      }
    });
  }

  void stateLinkHome() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showModal(context);
    });
  }

  Future<void> _MembersByCourse() async {
    try {
      final response = await Dio().get(
          urlBack + 'swimmer/course/' + courseSelected.toString(),
          options: Options(headers: {'Authorization': 'Token ${token}'}));

      membersList.clear();
      for (var item in response.data) {
        User member = User.fromJson(item);

        Map<String, dynamic> membersMap = {
          'id': member.id,
          'firstName': member.firstName,
          'lastName': member.lastName,
          'birthdate': member.birthdate
        };
        membersList.add(membersMap);
      }

      final selectedCourse = coursesToday.firstWhere(
          (course) => course['id'] == courseSelected,
          orElse: () => {});
      if (selectedCourse.isNotEmpty) {
        setState(() {
          this.day = selectedCourse['day'];
          this.hour = selectedCourse['hour'];
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _showModal(context);
          });
        });
      } else {
        setState(() {
          day = "Unknown";
          hour = "Unknown";
        });
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  void _showModal(BuildContext contextParent) {
    showModalBottomSheet(
        context: contextParent,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.5,
            child: AttendanceSheet(
              day: this.day,
              hour: this.hour,
              members: this.membersList,
              membersCount: this.membersList.length,
            ),
          );
        });
    print("show");
  }

  Widget classCard(void Function() onTap, BuildContext context, String? day,
      String? hour, MainScreenTraineeState state, int id) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 226, 219, 219)),
          color: Colors.white),
      width: 330,
      height: 200,
      child: Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                day ?? "no disponible",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 211, 202, 202)
                          .withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                width: 75,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            hour ?? "no disponible",
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: onTap,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> courses = coursesToday;
    MainScreenTraineeState parentState =
        context.findAncestorStateOfType<MainScreenTraineeState>()!;
    print(courses);
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              children: [
                Icon(Icons.calendar_month),
                Text(
                  today,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: courses.isEmpty
                ? Center(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'No tiene cursos asignados para el día de hoy',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: courses.length,
                    padding: const EdgeInsets.all(12),
                    itemBuilder: (_, index) => classGroups(
                      () async {
                        courseSelected = courses[index]['id'];
                        await _MembersByCourse();
                      },
                      context,
                      courses[index]['course_type'],
                      courses[index]['day'],
                      courses[index]['hour'],
                      courses[index]['id'],
                      () async {
                        await _MembersByCourse();
                      },
                      parentState,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget classGroups(
      void Function() onTap,
      BuildContext context,
      String courseType,
      String day,
      String hour,
      int id,
      void Function() onPopover,
      MainScreenTraineeState state) {
    return GestureDetector(
        child: Container(
      margin: const EdgeInsets.all(20),
      width: 350,
      height: 150,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor), color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
            child: Text(
              courseType,
              style: styleTitles,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 211, 202, 202)
                              .withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    width: 80,
                    child: Row(
                      children: [
                        Text(
                          hour ?? "no disponible",
                        ),
                        PopoverButton(
                          showModal: onPopover,
                          id: id,
                          state: state,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
