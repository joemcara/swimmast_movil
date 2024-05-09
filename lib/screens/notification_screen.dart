import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/profile_header.dart';
import 'package:swimmast_movil/widgets/widget_notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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

    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Column(
        children: [
          Center(
            child: Text(
              notificaciones,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Card.outlined(
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
    );
  }
}
