import 'package:flutter/material.dart';

class CalendarButton extends StatefulWidget {
  const CalendarButton({super.key});

  @override
  State<CalendarButton> createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_month),
              SizedBox(
                width: 8,
              ),
              Text(
                "${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}"
              ),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                onPressed: () async {
                  final DateTime? dateTime = await showDatePicker(
                    context: context,
                    initialDate: selectedDate, 
                    firstDate: DateTime(2000), 
                    lastDate: DateTime(3000)
                  );
                  if (dateTime != null) {
                    setState(() {
                        selectedDate = dateTime;
                    });
                  }
                }
              )
            ]
          );
  }
}