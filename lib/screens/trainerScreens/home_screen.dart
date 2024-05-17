import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final String clases = "Lunes y Miércoles";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Horarios asignados",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          ),
          const SizedBox(height: 15),

          //contenedor uno
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            width: 330,
            height: 200,
            child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text(
                  clases,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                )),
          ),

          SizedBox(height: 10),
          //contenedor dos
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            width: 330,
            height: 200,
            child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text(
                  clases,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                )),
          ),
        ],
      ),
    );
  }
}

List<String> horariosAsignados() {
  List<String> horarios = ["09:00", "10:00"];
  return horarios;
}
