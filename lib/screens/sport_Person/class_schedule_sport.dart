import 'package:swimmast_movil/models/course.dart';
import 'package:swimmast_movil/screens/member_Screens/packages_screen.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/widgets/customCalendar.dart';

class ClassScheduleSport extends StatefulWidget {
  const ClassScheduleSport({super.key});

  @override
  State<ClassScheduleSport> createState() =>
      _ClassScheduleSportState();
}

class _ClassScheduleSportState extends State<ClassScheduleSport> {

    DateTime? startDate;
    DateTime? endDate;
    List<Range> _selectedRanges = [];
    List<Map<String, Color>> colors = [];
    List<Widget> _displayedPackages = [];
    DateTime? selectedDate;
    List<Map<String, dynamic>> courseList = [];

  @override
  void initState() {
    super.initState();
    _AvilableCourse();
    _onDateSelected(DateTime.now());
  }

  Future<void> _AvilableCourse() async {
    try {
      final response = await Dio().get(
          urlBack + 'course/swimmer/' + idUser.toString(),
          options: Options(headers: {'Authorization': 'Token $token'}));
      for (var item in response.data) {
        Course course = Course.fromJson(item);
        List<String> dias = course.description.split(" y ");
        Map<String, dynamic> courseMap = {
          'day': course.description,
          'days': dias,
          'name': course.name,
          'startDate': course.startDate,
          'dueDate': course.dueDate,
          'hour': course.startTime + ' - ' + course.endTime,
          'trainer':
              course.instructor.firstName + ' ' + course.instructor.lastName,
        };
        courseList.add(courseMap);
        userCourse.clear();
        userCourse.add("${course.name}  ${course.description}");
        coursesList = courseList;
        print("lista de cursoooooo $userCourse");
        obtainDates();
      }
      setState(() {});
    } catch (e) {
      print(e);
      throw e;
    }
  }

  void obtainDates() {
    int i = 0;
    print("${coursesList.length}");
    for (var item in coursesList) {
      startDate = item['startDate'];
      endDate = item['dueDate'];
      _selectedRanges.add(Range(startDate!, endDate!,Colors.grey));
      i++;
    }
  }

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
      appBar: CustomAppBar(
        title: "Horarios de clases",
        back: true, 
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Wrap(
            runSpacing: 20,
            children: [
              CustomCalendar(
                initialRanges: _selectedRanges,
                onDateSelected: _onDateSelected,
              ),
              Wrap(
                children: _displayedPackages,
              )
            ],
          ),
        ),
      ),
    );
  }
}