import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  void deleteNotification(String id) {
    setState(() {
      items.removeWhere((element) => element['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notificaciones'),
      ),
      body: Card.outlined(
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        elevation: 0,
        child: Column(
          children: [
            if (items.isEmpty)
              const Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  'No hay notificaciones',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
            const SizedBox(height: 20),
            Expanded(
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
            )
          ],
        ),
      ),
    );
  }
}
