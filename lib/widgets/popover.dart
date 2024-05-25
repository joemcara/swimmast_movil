import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:popover/popover.dart';

class PopoverButton extends StatelessWidget {
  const PopoverButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Icon(
        Icons.more_vert,
        color: swimmastBlue,
      ),
      onTap: () {
        showPopover(
            context: context,
            bodyBuilder: (context) => const ListItems(),
            direction: PopoverDirection.bottom,
            width: 200,
            arrowHeight: 0,
            height: 100,
            barrierDismissible: true);
      },
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 25,
              child: const Center(child: Text('Agregar Tiempo')),
            ),
          ),
          const Divider(),
          Container(
            height: 25,
            child: const Center(child: Text('Eliminar tiempo')),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
