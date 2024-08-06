import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/sport_Person/class_schedule_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/class_sessions_sport.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/screens/sport_Person/shop_sport/shop_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/competencies_screen_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/history_screen_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/notification_screen_sport.dart';
import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';
import 'package:swimmast_movil/screens/sport_Person/profile_screen_sport.dart';

class HomeScreenSport extends StatefulWidget {
  @override
  _HomeScreenSportState createState() => _HomeScreenSportState();
}

class _HomeScreenSportState extends State<HomeScreenSport> {
  int _selectedIndex = -1;
  int _selectedtab = 0;

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
        nextPage = HomeScreenSport();
        break;
      case 1:
        nextPage = NotificationScreenSport(); 
        break;
      case 2:
        //nextPage = ProfileScreenSport(context); 
        nextPage = ProfileScreenSport();
        break;
      default:
        nextPage = HomeScreenSport();
        break;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  _buildGridItem(Icons.calendar_month, 'Horarios de clases', 0, ClassScheduleSport()),
                  _buildGridItem(Icons.school, 'Sesiones de clases',
                      1, ClassSessionsSport()),
                  _buildGridItem(
                      Icons.timer, 'Historial de tiempos', 2, HistoryScreenSport()),
                  _buildGridItem(Icons.workspace_premium,
                      'Competencias Pasadas', 3, CompetenciesScreenSport()),
                  _buildGridItem(Icons.shopping_cart, 'Cursos Disponibles', 4,
                      ShopSportScreen()),
                  _buildGridItem(Icons.history, 'Cursos Pasados', 5,
                      CompetenciesScreenSport()),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selected: _selectedtab,
        currentIndex: _onItemTapped,
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String title, int index,
      [Widget? nextPage]) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        if (nextPage != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        }
      },
      child: Expanded(
        child: Container(
            margin: EdgeInsets.all(8.0), 
            padding: EdgeInsets.all(7.0), 
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isSelected ? selectedGradient : defaultGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 207, 207, 207).withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 80,
                    color: isSelected
                        ? selectIconTextColor 
                        : defaultIconColor
                  ),
                  SizedBox(height: 10),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isSelected
                          ? selectIconTextColor 
                          : defaultIconTextColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
