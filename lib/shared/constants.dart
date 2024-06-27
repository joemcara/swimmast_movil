import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// shared constants back 
export 'package:dio/dio.dart';
const String urlBack = 'http://10.0.2.2:8000/api/v1/';


const Color swimmastBlue = Color.fromRGBO(11, 34, 181, 1);
const Color swimmastYellow = Color.fromRGBO(244, 232, 105, 1);
const Color swimmastGreen = Color.fromRGBO(71, 223, 00, 1);
const Color swimmastRed = Color.fromRGBO(181, 11, 1, 1);
const Color borderColor = Color.fromARGB(255, 226, 219, 219);


const TextStyle styleSubtitles =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const TextStyle styleTitles =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
int global = 3;
var attendanceStateModal = false;

