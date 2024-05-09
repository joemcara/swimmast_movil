import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final Function onSelected;
  const CustomDatePicker({super.key, required this.onSelected});
  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime _date = DateTime.now();
  void _showDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDate: _date,
    ).then((value) {
      setState(() {
        if (value != null) {
          _date = value;
          widget.onSelected(value);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _showDatePicker,
      child: Text(_date.toIso8601String()),
    );
  }
}
