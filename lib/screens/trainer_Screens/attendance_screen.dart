import 'package:swimmast_movil/models/coursesToday.dart';
import 'package:swimmast_movil/models/membersCourse.dart';
import 'package:swimmast_movil/screens/trainer_Screens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/attendance_sheet.dart';
import 'package:swimmast_movil/models/member.dart';
import 'package:swimmast_movil/shared/profile_header_trainee.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/widgets/popover.dart';

class AttendanceScreen extends StatefulWidget {
  AttendanceScreen({super.key});

  @override
  AttendanceScreenState createState() => AttendanceScreenState();
}

class AttendanceScreenState extends State<AttendanceScreen> {
  List<Map<String, dynamic>> membersList = [];
  Map<String, List<Map<String, dynamic>>> allCoursesToday = {};
  String day = "Today";
  String hour = "00:00";
  String endHour = "00:00";
  @override
  void initState() {
    super.initState();
    _CoursesForToday();
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
        UserCourse member = UserCourse.fromJson(item);
        Map<String, dynamic> membersMap = {
          'id': member.id,
          'firstName': member.firstName,
          'lastName': member.lastName,
          'birthdate': member.birthdate
        };
        membersList.add(membersMap);
      }

      membersByCourse = membersList;

      this.day = courseSelectedDay;
      this.hour = courseSelectedHour;
      this.endHour = courseSelectedHourEnd;
      if (attendanceStateModal) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showModal(context);
        });
      } else {
        setState(() {
          day = "Unknown";
          hour = "Unknown";
        });
      }

      print(membersList);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> _CoursesForToday() async {
    try {
      final response = await Dio().get(
          urlBack +
              'course/instructor/' +
              idUser.toString() +
              '/type_grouped/?date=' +
              dateFormatted,
          options: Options(headers: {'Authorization': 'Token $token'}));

      CourseAvailableList courses = CourseAvailableList.fromJson(response.data);
      List<Map<String, dynamic>> coursesTeam = [];
      List<Map<String, dynamic>> coursesIndividual = [];

      if (!courses.grupal.isEmpty) {
        for (var course in courses.grupal) {
          Map<String, dynamic> courseItem = {
            'id': course.id,
            'start_date': course.startDate,
            'start_time': course.startTime,
            'due_date': course.dueDate,
            'due_time': course.endTime,
            'day': course.description
          };
          coursesTeam.add(courseItem);
        }
      }

      if (!courses.individual.isEmpty) {
        for (var course in courses.individual) {
          Map<String, dynamic> courseItem = {
            'id': course.id,
            'start_date': course.startDate,
            'start_time': course.startTime.substring(0, 5),
            'due_date': course.dueDate,
            'due_time': course.endTime,
            'day': course.description
          };
          coursesIndividual.add(courseItem);
        }
      }

      allCoursesToday['grupal'] = coursesTeam;
      allCoursesToday['individual'] = coursesIndividual;

      setState(() {});
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
            heightFactor: 0.9,
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
    List<Map<String, dynamic>> courses = coursesToday;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Horario de clases",
        back: true,
      ),
      body: Container(
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
              child: allCoursesToday.isEmpty
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
                      itemCount: 1,
                      padding: const EdgeInsets.all(12),
                      itemBuilder: (_, index) => classGroups(() async {
                        //await _MembersByCourse();
                      },
                          context,
                          "GRUPAL",
                          ListView.builder(
                            itemCount: allCoursesToday['grupal']?.length,
                            itemBuilder: (_, indice) => hourClass(
                              context,
                              allCoursesToday['grupal']?[0]['start_time']
                                  .substring(0, 5),
                              allCoursesToday['grupal']?[indice]['due_time']
                                  .substring(0, 5),
                              allCoursesToday['grupal']?[indice]['id'],
                              () async {
                                allCoursesToday['grupal']?[indice]['id'];
                                courseSelectedDay =
                                    allCoursesToday['grupal']?[indice]['day'];
                                courseSelectedHour = allCoursesToday['grupal']
                                        ?[indice]['start_time']
                                    .substring(0, 5);
                                courseSelectedHourEnd =
                                    allCoursesToday['grupal']?[indice]
                                            ['due_time']
                                        .substring(0, 5);
                                await _MembersByCourse();
                              },
                            ),
                          )),
                    ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: allCoursesToday.isEmpty
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
                      itemCount: 1,
                      padding: const EdgeInsets.all(12),
                      itemBuilder: (_, index) => classGroups(() async {
                        await _MembersByCourse();
                      },
                          context,
                          " INDIVIDUAL",
                          ListView.builder(
                            itemCount: allCoursesToday['individual']?.length,
                            itemBuilder: (_, indice) => hourClass(
                              context,
                              allCoursesToday['individual']?[indice]
                                  ['start_time'],
                              allCoursesToday['individual']?[indice]
                                  ['due_time'],
                              allCoursesToday['individual']?[indice]['id'],
                              () async {
                                courseSelected = allCoursesToday['individual']
                                    ?[indice]['id'];
                                courseSelectedDay =
                                    allCoursesToday['individual']?[indice]
                                        ['day'];
                                courseSelectedHour =
                                    allCoursesToday['individual']?[indice]
                                            ['start_time']
                                        .substring(0, 5);
                                courseSelectedHourEnd =
                                    allCoursesToday['individual']?[indice]
                                            ['due_time']
                                        .substring(0, 5);
                                await _MembersByCourse();
                              },
                            ),
                          )),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget classGroups(void Function() onTap, BuildContext context,
      String courseType, ListView classes) {
    return Card(
      child: Container(
        width: 500,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color.fromARGB(255, 255, 249, 249),
        ),
        child: GestureDetector(
            child: Column(children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 50,
            width: 500,
            decoration: BoxDecoration(
                color: defaultGradient[0],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                )),
            child: Text(courseType,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: SizedBox(
                height: 200, // Ajusta este valor según sea necesario
                child: classes,
              )),
        ])),
      ),
    );
  }
}

Widget hourClass(BuildContext context, String hourStart, String hourEnd, int id,
    void Function() onPopover) {
  courseSelectedHour = hourStart ?? "no disponible";
  courseSelectedHourEnd = hourEnd ?? "no disponible";
  return Container(
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
                  color:
                      const Color.fromARGB(255, 211, 202, 202).withOpacity(0.5),
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
                  hourStart ?? "no disponible",
                ),
                PopoverButton(
                  showModal: onPopover,
                  id: id,
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
