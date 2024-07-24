import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/screens/sport_Person/shop_sport/shop_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/competencies_screen_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/history_screen_sport.dart';
import 'package:swimmast_movil/screens/notification_screen.dart';
import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotificationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Color(0x2C3E50)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.signal_cellular_alt, color: Colors.grey[600]),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Katherine!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildGridItem(Icons.calendar_month, 'Horarios de clases', 0),
                  _buildGridItem(
                      Icons.book, 'Historial', 1, HistoryScreenSport()),
                  _buildGridItem(Icons.shopping_cart, 'Paquetes Disponibles', 2,
                      ShopSportScreen()),
                  _buildGridItem(Icons.workspace_premium,
                      'Competencias Pasadas', 3, CompetenciesScreenSport()),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color.fromARGB(141, 23, 46, 85) : Colors.white,
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
                    : Color.fromRGBO(32, 21, 73, 1)),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? Color.fromRGBO(250, 250, 252, 1)
                    : Color.fromRGBO(32, 21, 73, 1),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
