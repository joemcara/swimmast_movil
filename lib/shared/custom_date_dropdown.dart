import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final Function onSelected;
  const CustomDatePicker({super.key, required this.onSelected});
  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final Map<int, String> days = {
    1: "Lunes",
    2: "Martes",
    3: "Miércoles",
    4: "Jueves",
    5: "Viernes",
    6: "Sábado",
    7: "Domingo"
  };
  final Map<int, String> months = {
    1: "Enero",
    2: "Febrero",
    3: "Marzo",
    4: "Abril",
    5: "Mayo",
    6: "Junio",
    7: "Julio",
    8: "Agosto",
    9: "Septiembre",
    10: "Octubre",
    11: "Noviembre",
    12: "Diciembre"
  };

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

  String _formatDate(DateTime date) {
    return " ${days[date.weekday]}, ${date.day} de ${months[date.month]}";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _showDatePicker,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.calendar_month),
          Text(_formatDate(_date)),
          const Icon(Icons.keyboard_arrow_down_outlined)
        ],
      ),
    );
  }
}
