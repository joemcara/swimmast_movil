import 'package:swimmast_movil/screens/trainer_Screens/attendance_screen.dart';
import 'package:swimmast_movil/screens/trainer_Screens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/models/courseInstructor.dart';
import 'package:provider/provider.dart';
import 'package:swimmast_movil/models/courseSelected.dart';
import 'package:swimmast_movil/widgets/memberTrainerAdmin.dart';

class HomeScreen extends StatefulWidget {
  final int? idUser;
  final String? token;

  const HomeScreen({super.key, this.idUser, this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> courseList = [];
  List<Map<String, dynamic>> coursesTodayList = [];
  int _selectedIndex = 0;
  int _selectedtab = 0;

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
          'due_hour': course.endTime,
          'days': course.description.split("y")
        };
        for (var i = 0; i < courseMap['days'].length; i++) {
          courseMap['days'][i] = courseMap['days'][i].replaceAll(' ', '');
        }
        courseList.add(courseMap);

        var courseiItem = courseMap['days'];
        if (courseiItem.contains('Viernes')) {
          coursesTodayList.add(courseMap);
        }
      }

      coursesList = courseList;
      coursesToday = coursesTodayList;
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
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          _buildGridItem(Icons.calendar_month, 'Cursos', 1, parentState),
          _buildGridItem(
              Icons.calendar_month, 'Manejar Miembros', 4, parentState)
        ],
      ),
    );
  }

  Widget _buildGridItem(
      IconData icon, String title, int index, MainScreenTraineeState state) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        if (title == "Cursos") {
          courseSelected = 1;
          state.changeSelected(index, 'Cursos');
          print(index);
        } else if (title == "Manejar Miembros") {
          courseSelected = 4;
          state.changeSelected(index, "Manejar Miembros");
          print(index);
        } else {
          setState(() {
            _selectedIndex = index;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color:
              isSelected ? Color.fromARGB(141, 23, 46, 85) : defaultGradient[0],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 50,
                color: isSelected
                    ? Color.fromRGBO(255, 255, 255, 1)
                    : Color.fromRGBO(255, 255, 255, 1)),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? Color.fromRGBO(250, 250, 252, 1)
                    : Color.fromRGBO(255, 255, 255, 1),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
