import 'package:flutter/material.dart';

class CourseSelected with ChangeNotifier {
  int _selectedCourseId = 0;

  int get selectedCourseId => _selectedCourseId;

  void selectCourse(int id) {
    _selectedCourseId = id;
    notifyListeners();
  }
}
