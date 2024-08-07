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

  @override
  void initState() {
    super.initState();
    if (attendanceStateModal == true) {
      _MembersByCourse();
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

      final selectedCourse = coursesList.firstWhere(
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
                courseSelected = courses[index]['id'];
                await _MembersByCourse();
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
