import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swimmast_movil/models/member.dart';

// shared constants back 
export 'package:dio/dio.dart';
export 'package:flutter/material.dart';
export 'package:swimmast_movil/shared/button.dart';
export 'package:swimmast_movil/shared/profile_header.dart';

const String urlBack = 'http://10.0.2.2:8000/api/v1/';
var token = '';
var idUser = 0;

Member? miembro;


const Color swimmastBlue = Color.fromRGBO(11, 34, 181, 1);
const Color swimmastYellow = Color.fromRGBO(244, 232, 105, 1);
const Color swimmastGreen = Color.fromRGBO(82, 201, 26, 1);
const Color swimmastRed = Color.fromRGBO(181, 11, 1, 1);
const Color borderColor = Color.fromARGB(255, 226, 219, 219);


const TextStyle styleSubtitles =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const TextStyle styleTitles =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
int global = 3;
var attendanceStateModal = false;

