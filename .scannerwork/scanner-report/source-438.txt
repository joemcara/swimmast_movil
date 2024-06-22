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
        background: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          color: Colors.red,
          alignment: Alignment.centerRight,
          child: const Icon(Icons.delete, color: Colors.white, size: 30),
        ),
        onDismissed: (direction) {
          deleteNotification(notificationId);
        },
        child: SwimmastCard(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            color: swimmastGreen,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(description, style: const TextStyle(color: Colors.grey))
              ],
            )
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
