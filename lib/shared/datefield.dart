import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/inputs.dart';

class DateField extends StatefulWidget {
  DateField(
      {super.key,
      required this.dateController,
      required this.nameRepresentative,
      required this.relationship,
      required this.userName,
      required this.names,
      required this.lastNames});

  final TextEditingController dateController;
  TextEditingController userName;
  TextEditingController nameRepresentative;
  TextEditingController relationship;
  TextEditingController names;
  TextEditingController lastNames;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  bool _isChildren = false;
  bool _userName = false;
  int _selectedOption = 0;

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2300),
    );
    if (picked != null)
      setState(() {
        widget.dateController.text = picked.toString().split(" ")[0];
        if (_adult(widget.dateController.text) < 18) {
          _isChildren = true;
        } else {
          _isChildren = false;
        }
      });
  }

  int _adult(String date) {
    var now = DateTime.now();
    var birth = DateTime.parse(date);
    var difference = now.difference(birth);
    return difference.inDays ~/ 365;
  }

  Future<void> _selectUser(String name, String lastName, String date) async {
    List<String> users = [];
    try {
      final response = await Dio().post(
        urlBack + 'administration/usernames/',
        data: {
          'first_name': name,
          'last_name': lastName,
          'role': 3,
          'birthdate': date,
        },
      );
      for (var item in response.data) {
        users.add(item);
      }
    } catch (e) {
      print(e);
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Selecione uno de los usuarios disponibles"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                RadioListTile<int>(
                  value: 1,
                  groupValue: _selectedOption,
                  title: Text(users[0]),
                  onChanged: (int? value) {
                    setState(() {
                      _userName = true;
                      widget.userName.text = users[0];
                      Navigator.of(context).pop();
                    });
                  },
                ),
                RadioListTile<int>(
                  value: 2,
                  groupValue: _selectedOption,
                  title: Text(users[1]),
                  onChanged: (int? value) {
                    setState(() {
                      _userName = true;
                      widget.userName.text = users[1];
                      Navigator.of(context).pop();
                    });
                  },
                ),
                RadioListTile<int>(
                  value: 3,
                  groupValue: _selectedOption,
                  title: Text(users[2]),
                  onChanged: (int? value) {
                    setState(() {
                      _userName = true;
                      widget.userName.text = users[2];
                      Navigator.of(context).pop();
                    });
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                // Add more options as needed
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var inputDecoration = InputDecoration(
      hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.33)),
      labelText: 'Año de nacimiento',
      border: InputBorder.none,
      prefixIcon: const Icon(Icons.calendar_today),
    );

    return Wrap(
      runSpacing: 15.0,
      children: [
        Visibility(
            visible: _userName,
            child: Center(
              child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(5),
              border: Border.all(color: const Color.fromARGB(255, 65, 65, 65)),
              color: Colors.white),
                child: Row(
                  children: [
                    Text("Username:\t\t\t\t"),
      
                    Text(
                      widget.userName.text,
                    ),
                  ],
                ),
              ),
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
          child: TextField(
            controller: widget.dateController,
            style: const TextStyle(fontSize: 16, letterSpacing: 2),
            decoration: inputDecoration,
            readOnly: true,
            onTap: () async {
              await _selectDate();
              await _selectUser(widget.names.text, widget.lastNames.text,
                  widget.dateController.text);
            },
          ),
        ),
        Visibility(
          visible: _isChildren,
          child: TextInput(
            hintText: 'Nombre del representante',
            controller: widget.nameRepresentative,
          ),
        ),
        Visibility(
          visible: _isChildren,
          child: TextInput(
            hintText: 'Parentesco con el menor',
            controller: widget.relationship,
          ),
        )
      ],
    );
  }
}
