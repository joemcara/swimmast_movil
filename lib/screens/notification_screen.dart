import 'package:flutter/material.dart';
import 'package:swimmast_movil/widgets/widget_notification.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/shared/constants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Future<List<Map<String, String>>>? _items;List<Map<String, String>> items = [
  //   {'id': '1', 'title': 'titulo 1', 'description': 'descripcion 1'},
  //   {'id': '2', 'title': 'titulo 2', 'description': 'descripcion 2'},
  //   {'id': '3', 'title': 'titulo 3', 'description': 'descripcion 3'},
  //   {'id': '4', 'title': 'titulo 4', 'description': 'descripcion 4'},
  // ];
  @override
  void initState() {
    super.initState();
    _items = getNotifications();
  }

  String notificaciones = 'Notificaciones';
  Future<List<Map<String, String>>>? _items;
  Future<List<Map<String, String>>> getNotifications() async {
    try {
      final response = await Dio().get(
        urlBack + 'notification/notification_status/all/swimmast_user/$idUser/',
      );
      if (response.statusCode == 200) {
        // Convertir cada mapa en la lista a Map<String, String>
        return (response.data as List).map((item) {
          return Map<String, String>.from(item.map((key, value) => MapEntry(
                key.toString(),
                value.toString(),
              )));
        }).toList();
      } else {
        throw Exception('Error al obtener notificaciones');
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  void deleteNotification(String id) {
    setState(() {
      if (_items != null) {
        _items = _items!.then((list) {
          list.removeWhere((element) => element['id'] == id);
          if (list.isEmpty) {
            notificaciones = 'No hay notificaciones';
          }
          return list;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: notificaciones,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
                // child: ListView.builder(
                //   itemCount: items.length,
                //   padding: const EdgeInsets.all(6),
                //   itemBuilder: (_, index) => NotificationWidget(
                //     notificationId: items[index]['id'].toString(),
                //     title: items[index]['title'],
                //     description: items[index]['message'],
                //     deleteNotification: deleteNotification,
                //   ),
                // ),
                child: FutureBuilder<List<Map<String, String>>>(
                    future: _items,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          padding: const EdgeInsets.all(6),
                          itemBuilder: (_, index) => NotificationWidget(
                            notificationId:
                                snapshot.data![index]['id'].toString(),
                            title: snapshot.data![index]['title']!,
                            description: snapshot.data![index]['message']!,
                            deleteNotification: deleteNotification,
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
