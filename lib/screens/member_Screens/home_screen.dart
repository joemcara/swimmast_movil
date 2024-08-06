import 'package:swimmast_movil/models/course.dart';
import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';
import '../../shared/constants.dart';
import 'package:swimmast_movil/screens/member_Screens/history_screen.dart';
import 'package:swimmast_movil/screens/member_Screens/profile_screen.dart';
import 'package:swimmast_movil/screens/sport_Person/notification_screen_sport.dart';
import 'package:swimmast_movil/widgets/griditem.dart';

class HomeScreenMember extends StatefulWidget {
  final int? idUser;
  final String? token;

  const HomeScreenMember({super.key, this.idUser, this.token});

  @override
  State<HomeScreenMember> createState() => _HomeScreenMemberState();
}

class _HomeScreenMemberState extends State<HomeScreenMember> {
  int _selectedIndex = -1;
  int _selectedtab = 0;
  List<Map<String, String>> courseList = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedtab = index;
    });
    _navigateToScreen(index);
  }

  void _navigateToScreen(int index) {
    Widget nextPage;
    switch (index) {
      case 0:
        nextPage = HomeScreenMember();
        break;
      case 1:
        nextPage = NotificationScreenSport();
        break;
      case 2:
        //nextPage = ProfileScreenSport(context);
        nextPage = ProfileScreen();
        break;
      default:
        nextPage = HomeScreenMember();
        break;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  @override
  void initState() {
    super.initState();
    _AvilableCourse();
  }

  Future<void> _AvilableCourse() async {
    try {
      final response = await Dio().get(
          urlBack + 'course/swimmer/' + idUser.toString(),
          options: Options(headers: {'Authorization': 'Token $token'}));
      for (var item in response.data) {
        Course course = Course.fromJson(item);
        Map<String, String> courseMap = {
          'day': course.description,
          'hour': course.startTime + ' - ' + course.endTime,
          'trainer':
              course.instructor.firstName + ' ' + course.instructor.lastName,
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
    Size size = MediaQuery.of(context).size;
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Hola Katherine',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 200, 200, 201),
        elevation: 0,
        toolbarHeight: kToolbarHeight + statusBarHeight,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: defaultGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                "lib/assets/so_member.png",
                height: size.height * .20,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * .30,
                ),
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
                        nextPage: HistoryScreen(),
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
                        icon: Icons.school,
                        title: 'Sesiones de clases',
                        index: 1,
                        nextPage: HistoryScreen(),
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
                        icon: Icons.timer,
                        title: 'Historial de tiempos',
                        index: 2,
                        nextPage: HistoryScreen(),
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
                        icon: Icons.shopping_cart,
                        title: 'Cursos Disponibles',
                        index: 3,
                        nextPage: HistoryScreen(),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selected: _selectedtab,
        currentIndex: _onItemTapped,
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
