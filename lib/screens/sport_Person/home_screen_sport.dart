
import 'package:swimmast_movil/screens/sport_Person/class_schedule_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/class_sessions_sport.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/screens/sport_Person/shop_sport/shop_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/competencies_screen_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/history_screen_sport.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/widgets/griditem.dart';

class HomeScreenSport extends StatefulWidget {
  @override
  _HomeScreenSportState createState() => _HomeScreenSportState();
}

class _HomeScreenSportState extends State<HomeScreenSport> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar:CustomAppBar(title:"Hola  ${miembro!.user.firstName}",),
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
                    nextPage: ClassScheduleSport(),
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
                    nextPage: ClassSessionsSport(),
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
                    nextPage: HistoryScreenSport(),
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
                    icon: Icons.workspace_premium,
                    title: 'Competencias Pasadas',
                    index: 3,
                    nextPage: CompetenciesScreenSport(),
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
                    index: 4,
                    nextPage: ShopSportScreen(),
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
                    icon: Icons.history,
                    title: 'Cursos Pasados',
                    index: 5,
                    nextPage: CompetenciesScreenSport(),
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
    );
  }
}
