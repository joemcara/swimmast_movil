import 'package:swimmast_movil/models/course.dart';

import '../../shared/constants.dart';

class HomeScreenMember extends StatefulWidget {

  final int? idUser;
  final String? token;

  const HomeScreenMember({super.key, this.idUser, this.token});
  
  @override
  State<HomeScreenMember> createState() => _HomeScreenMemberState();
}

class _HomeScreenMemberState extends State<HomeScreenMember> {
  List<Map<String, String>> courseList = []; 

  @override
  void initState() {
    super.initState();
    _AvilableCourse();
  }

    Future<void> _AvilableCourse() async {
    try {
      final response = await Dio().get(
        urlBack + 'course/swimmer/' + idUser.toString(),
        options: Options(
          headers: {
            'Authorization': 'Token $token'
          }
        )
      );
      for (var item in response.data) {
        Course course = Course.fromJson(item);
        Map<String, String> courseMap = {
          'day': course.description,
          'hour': course.startTime + ' - ' + course.endTime,
          'trainer': course.instructor.firstName + ' ' + course.instructor.lastName,
        };
        courseList.add(courseMap);
        userCourse.clear();
        userCourse.add("${course.name}  ${course.description}");
        
      }
      setState(() {});
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Column(
          children: [
            const Text(
              "Horarios",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: courseList.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (_, index) => _scheduleBox(
                    courseList[index]['day'],
                    courseList[index]['hour'],
                    courseList[index]['trainer'],
                    courseList[index]['course'],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _scheduleBox(
  String? day,
  String? hour,
  String? trainer,
  String? imageUrl,
) {
  return GestureDetector(
    onTap: () {},
    child: Card.outlined(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
            children: [
              Image.asset(
                imageUrl ?? "lib/assets/swimmast_logo.png",
                height: 150,
                width: 100,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Día: ",
                        style: TextStyle(
                            fontSize: 16,
                            height: 2,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        day ?? "no disponible",
                        style: const TextStyle(fontSize: 16, height: 2),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Hora: ",
                        style: TextStyle(
                            fontSize: 16,
                            height: 2,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        hour ?? "no disponible",
                        style: const TextStyle(fontSize: 16, height: 2),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Entrenador/a: ",
                        style: TextStyle(
                            fontSize: 16,
                            height: 2,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                      Text(
                        trainer ?? "no disponible",
                        style: const TextStyle(fontSize: 16, height: 2),
                      )
                ],
              ),
            ],
          ),
        )),
  );
}
