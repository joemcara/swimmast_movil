import 'package:swimmast_movil/screens/trainer_Screens/attendance_screen.dart';
import 'package:swimmast_movil/screens/trainer_Screens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/models/courseInstructor.dart';
import 'package:provider/provider.dart';
import 'package:swimmast_movil/models/courseSelected.dart';

class HomeScreen extends StatefulWidget {
  final int? idUser;
  final String? token;

  const HomeScreen({super.key, this.idUser, this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> courseList = [];

  @override
  void initState() {
    super.initState();
    _AsignedCourse();
  }

  Future<void> _AsignedCourse() async {
    try {
      final response = await Dio().get(
          urlBack + 'course/instructor/' + idUser.toString(),
          options: Options(headers: {'Authorization': 'Token $token'}));

      for (var item in response.data) {
        Courseinstructor course = Courseinstructor.fromJson(item);

        Map<String, dynamic> courseMap = {
          'id': course.id,
          'name': course.name,
          'course_type': course.courseType.name,
          'course_status': course.courseStatus,
          'day': course.description,
          'hour': course.startTime,
          'due_hour': course.endTime
        };
        courseList.add(courseMap);
      }
      coursesList = courseList;
      setState(() {});
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    MainScreenTraineeState parentState =
        context.findAncestorStateOfType<MainScreenTraineeState>()!;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Horarios asignados",
                style: styleTitles,
              )
            ],
          ),
          const SizedBox(height: 15),
          Flexible(
            child: Container(
              child: ListView.builder(
                  itemCount: courseList.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (_, index) => classCard(
                      courseList[index]['day'],
                      courseList[index]['hour'],
                      parentState,
                      courseList[index]['id'])),
            ),
          )
        ],
      ),
    );
  }
}

Widget classCard(
    String? day, String? hour, MainScreenTraineeState state, int id) {
  return (Container(
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
                width: 60,
                child: Text(
                  hour ?? "no disponible",
                ),
              ),
              onTap: () {
                courseSelected = id;
                state.changeSelected(id);
                attendanceStateModal = true;

                ;
              },
            )
          ],
        )),
  ));
}
