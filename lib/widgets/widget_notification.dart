import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/swimmast_card.dart';

class NotificationWidget extends StatelessWidget {
  final String notificationId;
  final String title;
  final String description;
  final Function deleteNotification;
  const NotificationWidget(
      {super.key,
      required this.notificationId,
      required this.title,
      required this.description,
      required this.deleteNotification});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(notificationId),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) async {
          return await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Confirmar eliminación'),
                content: Text(
                    '¿Está seguro de que desea eliminar esta suscripción?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('Eliminar'),
                  ),
                ],
              );
            },
          );
        },
        background: Container(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          alignment: Alignment.centerRight, 
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: const Padding(
            padding:
                EdgeInsets.only(right: 20), 
            child: Icon(Icons.delete, color: Colors.white, size: 30),
          ),
        ),
        onDismissed: (direction) {
          deleteNotification(notificationId);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Notificación eliminada')),
          );
        },
        child: SwimmastCard(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          color: swimmastGreen,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(description, style: const TextStyle(color: Colors.grey)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.more_vert, color: Colors.grey),
              ),
            ],
          ),

          // child: Card.outlined(
          //     margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          //     child: ListTile(
          //       title: Text(title),
          //       subtitle:
          //           Text(description, style: const TextStyle(color: Colors.grey)),
          //     )),
        ));
  }
}
