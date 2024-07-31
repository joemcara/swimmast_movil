import 'package:flutter/material.dart';

class ItemSelection extends StatefulWidget {
  final String title;
  final List<String> styles;

  ItemSelection({required this.title, required this.styles});

  @override
  State<ItemSelection> createState() => _ItemSelectionState();
}

class _ItemSelectionState extends State<ItemSelection> {
  late String title;

  @override
  void initState(){
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
            child: Text(style),
            value: style
          );
        }).toList(),
        onSelected: (String newItem) {
            setState(() {
              title = newItem;
            });
        }
      )
    );
  }
}
