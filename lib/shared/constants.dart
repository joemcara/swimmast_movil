import 'package:flutter/material.dart';
import 'package:swimmast_movil/models/member.dart';

// shared constants back
export 'package:dio/dio.dart';
export 'package:flutter/material.dart';
export 'package:swimmast_movil/shared/button.dart';
export 'package:swimmast_movil/shared/profile_header.dart';

const String urlBack = 'http://10.0.2.2:8000/api/v2/';

Member? miembro;
List<Map<String, dynamic>> coursesList = [];
List<Map<String, dynamic>> coursesToday = [];
List<Map<String, dynamic>> allCoursesMembers = [];
List<dynamic> onlyMembers = [];
List<dynamic> membersByCourse = [];
List<Map<String, dynamic>> attendance = [];
Map<int, bool> attendanceMap = {};
int courseSelected = 1;
String courseSelectedDay = '';
String courseSelectedHour = '';

const Color swimmastBlue = Color.fromRGBO(11, 34, 181, 1);
const Color swimmastYellow = Color.fromRGBO(244, 232, 105, 1);
const Color swimmastGreen = Color.fromRGBO(82, 201, 26, 1);
const Color swimmastRed = Color.fromRGBO(181, 11, 1, 1);
const Color borderColor = Color.fromARGB(255, 226, 219, 219);

const Color defaultIconColor = Colors.white;
const Color defaultIconTextColor = Colors.white;

const Color selectIconTextColor = Color.fromRGBO(9, 9, 41, 1);
const Color selectBoxTextColor = Colors.white;
const Color selectTextTextColor = Colors.white;

const Color buttoncoloryellow = Color.fromARGB(255, 240, 204, 0);
const Color buttoncolorblue = Color.fromRGBO(30, 42, 52, 1);

List<Color> defaultGradient = [Color(0xFF2F4458), Color(0xFF1E2A34)];
List<Color> selectedGradient = [
  Color.fromARGB(255, 167, 167, 167),
  Color.fromARGB(255, 223, 223, 223)
];

const TextStyle styleSubtitles =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const TextStyle styleSubtitlesSmall =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
const TextStyle styleTitles =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
int global = 3;
var attendanceStateModal = false;
String today = '';
String dateFormatted = '';
String dayNow = '';

//Member constans
var phoneNumber;
var birthDate;
var token;
var idUser;
var userName;
var role;
var userCourse = [];
var userCourses;

List<Color> colorsList = [
  Colors.red,
  swimmastBlue,
  Colors.amber,
  Colors.orange
];
