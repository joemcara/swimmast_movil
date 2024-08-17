import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:swimmast_movil/models/member.dart';
import 'package:swimmast_movil/screens/sport_Person/shop_sport/shop_sport.dart';
import 'package:swimmast_movil/screens/trainer_Screens/member_admin_screen.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/models/courseInstructor.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/widgets/griditem.dart';
import 'package:swimmast_movil/screens/trainer_Screens/attendance_screen.dart';

class HomeScreen extends StatefulWidget {
  final int? idUser;
  final String? token;

  const HomeScreen({super.key, this.idUser, this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = -1;
  List<Map<String, dynamic>> courseList = [];
  List<Map<String, dynamic>> coursesTodayList = [];
  List<Map<String, dynamic>> membersList = [];
  List<Map<String, dynamic>> allCourses = [];

  String _dateFormated = "";
  String day = "";

  @override
  void initState() {
    super.initState();
    dateToday();
    _AsignedCourse();
  }

  Future<void> dateToday() async {
    await initializeDateFormatting('es_ES', null);
    final format = DateFormat('EEEE, d \'de\' MMMM \'del\' yyyy', 'es_ES');
    var date = format.format(DateTime.now());
    DateTime formattedDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    String formattedDateString = DateFormat('yyyy-MM-dd').format(formattedDate);
    dateFormatted = formattedDateString;
    final dateUppercase = date[0].toUpperCase() + date.substring(1);
    day = dateUppercase.split(",")[0];
    setState(() {
      _dateFormated = dateUppercase;
      today = _dateFormated;
      dayNow = day;
    });
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
      await MembersByTrainer();
      allCoursesMembers = allCourses;
      //setState(() {});
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> MembersByTrainer() async {
    for (var i = 0; i < coursesList.length; i++) {
      Map<String, dynamic> courseMap = {
        'id': coursesList[i]['id'],
        'members': []
      };
      allCourses.add(courseMap);
    }

    onlyMembers.clear();
    for (var i = 0; i < allCourses.length; i++) {
      await _MembersByCourse(allCourses[i]['id']);
      allCourses[i]['members'].addAll(membersList);
      onlyMembers.addAll(membersList);
      membersList.clear();
    }
  }

  Future<void> _MembersByCourse(course) async {
    try {
      final response = await Dio().get(
          urlBack + 'swimmer/course/' + course.toString(),
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
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: CustomAppBar(
        title: "Hola  ${miembro!.user.firstName}",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  GridItem(
                    icon: Icons.calendar_month,
                    title: 'Horarios de clases',
                    index: 0,
                    nextPage: AttendanceScreen(),
                    selectedIndex: _selectedIndex,
                    onSelect: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    selectedGradient: selectedGradient,
                    defaultGradient: defaultGradient,
                    selectIconTextColor: selectIconTextColor,
                    defaultIconColor: defaultIconColor,
                    defaultIconTextColor: defaultIconTextColor,
                  ),
                  GridItem(
                    icon: Icons.people,
                    title: 'Manejar miembros',
                    index: 0,
                    nextPage: Memberadmin(),
                    selectedIndex: _selectedIndex,
                    onSelect: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    selectedGradient: selectedGradient,
                    defaultGradient: defaultGradient,
                    selectIconTextColor: selectIconTextColor,
                    defaultIconColor: defaultIconColor,
                    defaultIconTextColor: defaultIconTextColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
