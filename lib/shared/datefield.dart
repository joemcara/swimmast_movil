import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/inputs.dart';

class DateField extends StatefulWidget {
  DateField({
  super.key, 
  required this.dateController,
  required this.nameRepresentative,
  required this.relationship
  });

  final TextEditingController dateController;
  TextEditingController nameRepresentative;
  TextEditingController relationship;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  bool _isChildren = false;

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
        }else{
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
            onTap: () async{
              await _selectDate();
            },
        
          ),
        ),
        
        Visibility(
          visible: _isChildren,
          child:TextInput(
          hintText: 'Nombre del representante',
          controller: widget.nameRepresentative,
          ),
        ),
        Visibility(
          visible: _isChildren,
          child:TextInput(
          hintText: 'Parentesco con el menor',
          controller: widget.relationship,
          ),
        )
      ],
    );
  }
}
