import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/constants.dart';

class ItemSelection extends StatefulWidget {
  final String title;
  final List<String> styles;
  final ValueChanged<String> onSelected;

  ItemSelection(
      {required this.title, required this.styles, required this.onSelected});

  @override
  State<ItemSelection> createState() => _ItemSelectionState();
}

class _ItemSelectionState extends State<ItemSelection> {
  late String title;

  @override
  void initState() {
    super.initState();
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        trailing: PopupMenuButton<String>(
            itemBuilder: (context) => widget.styles.map((style) {
                  return PopupMenuItem<String>(
                      child: Text(
                        style,
                        style: TextStyle(color: Colors.black),
                      ),
                      value: style);
                }).toList(),
            onSelected: (String newItem) {
              setState(() {
                title = newItem;
              });
              widget.onSelected(newItem);
            }));
  }
}
