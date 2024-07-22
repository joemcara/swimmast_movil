import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/attendance_sheet.dart';
import 'package:swimmast_movil/models/member.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  AttendanceScreenState createState() => AttendanceScreenState();
}

class AttendanceScreenState extends State<AttendanceScreen> {
  List<Map<String, dynamic>> membersList = [];
  String day = "Today";
  String hour = "00:00";
  int courseSelected = 1; // Variable para el curso seleccionado

  @override
  void initState() {
    super.initState();
    _MembersByCourse();
    if (attendanceStateModal == true) {
      stateLinkHome();
    }
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
          options: Options(headers: {'Authorization': 'Token $token'}));

      // Limpiar lista antes de agregar nuevos datos
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

      // Actualizar día y hora según el curso seleccionado
      final selectedCourse = coursesList.firstWhere(
          (course) => course['id'] == courseSelected,
          orElse: () => {});
      if (selectedCourse.isNotEmpty) {
        setState(() {
          day = selectedCourse['day'];
          hour = selectedCourse['hour'];
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
          return AttendanceSheet(
            day: day,
            hour: hour,
            members: membersList,
            membersCount: membersList.length,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> courses = coursesList;
    print(courses);
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Grupos de clases",
              style: styleTitles,
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
              itemCount: courses.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (_, index) => classGroups(() async {
                courseSelected =
                    courses[index]['id']; // Actualizar curso seleccionado
                await _MembersByCourse(); // Obtener miembros
                _showModal(context); // Mostrar modal después de obtener datos
              }, context, courses[index]['course_type'], courses[index]['day'],
                  courses[index]['hour'], courses[index]['id']),
            ))
          ],
        ));
  }
}

Widget classGroups(void Function() onTap, BuildContext context,
    String courseType, String day, String hour, int id) {
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
              padding: const EdgeInsets.fromLTRB(
                  30, 8, 30, 8), // Padding on all sides
              child: Text(
                courseType,
                style: styleTitles,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  30, 8, 30, 8), // Padding on all sides
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [Icon(Icons.calendar_month), Text(day)],
                  ),
                  Row(
                    children: [Icon(Icons.schedule), Text(hour)],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: onTap);
}
