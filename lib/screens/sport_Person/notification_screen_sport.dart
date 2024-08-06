import 'package:flutter/material.dart';
import 'package:swimmast_movil/widgets/widget_notification.dart';
import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';
import 'package:swimmast_movil/screens/sport_Person/home_screen_sport.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/screens/sport_Person/profile_screen_sport.dart';
import 'package:swimmast_movil/shared/constants.dart';

class NotificationScreenSport extends StatefulWidget {
  const NotificationScreenSport({super.key});

  @override
  State<NotificationScreenSport> createState() =>
      _NotificationScreenSportState();
}

class _NotificationScreenSportState extends State<NotificationScreenSport> {
  int _selectedtab = 1;

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

  List<Map<String, String>> items = [
    {'id': '1', 'title': 'titulo 1', 'description': 'descripcion 1'},
    {'id': '2', 'title': 'titulo 2', 'description': 'descripcion 2'},
    {'id': '3', 'title': 'titulo 3', 'description': 'descripcion 3'},
    {'id': '4', 'title': 'titulo 4', 'description': 'descripcion 4'},
  ];

  String notificaciones = 'Notificaciones';

  void deleteNotification(String id) {
    setState(() {
      items.removeWhere((element) => element['id'] == id);
      if (items.isEmpty) {
        notificaciones = 'No hay notificaciones';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      appBar: CustomAppBar(
        title: notificaciones,
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Card(
                child: ListView.builder(
                  itemCount: items.length,
                  padding: const EdgeInsets.all(6),
                  itemBuilder: (_, index) => NotificationWidget(
                    notificationId: items[index]['id']!,
                    title: items[index]['title']!,
                    description: items[index]['description']!,
                    deleteNotification: deleteNotification,
                  ),
                ),
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
}
