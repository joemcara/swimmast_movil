// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

List<Course> courseFromJson(String str) =>
    List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

String courseToJson(List<Course> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
  int id;
  Instructor instructor;
  CourseStatus courseType;
  CourseStatus courseStatus;
  DateTime startDate;
  DateTime dueDate;
  String startTime;
  String endTime;
  String name;
  String price;
  String description;

  Course({
    required this.id,
    required this.instructor,
    required this.courseType,
    required this.courseStatus,
    required this.startDate,
    required this.dueDate,
    required this.startTime,
    required this.endTime,
    required this.name,
    required this.price,
    required this.description,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        instructor: Instructor.fromJson(json["instructor"]),
        courseType: CourseStatus.fromJson(json["course_type"]),
        courseStatus: CourseStatus.fromJson(json["course_status"]),
        startDate: DateTime.parse(json["start_date"]),
        dueDate: DateTime.parse(json["due_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "instructor": instructor.toJson(),
        "course_type": courseType.toJson(),
        "course_status": courseStatus.toJson(),
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "due_date":
            "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "name": name,
        "price": price,
        "description": description,
      };
}

class CourseStatus {
  int id;
  String name;
  String description;
  String? code;

  CourseStatus({
    required this.id,
    required this.name,
    required this.description,
    this.code,
  });

  factory CourseStatus.fromJson(Map<String, dynamic> json) => CourseStatus(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "code": code,
      };
}

class Instructor {
  int id;
  CourseStatus role;
  String firstName;
  String lastName;
  String username;

  Instructor({
    required this.id,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.username,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        id: json["id"],
        role: CourseStatus.fromJson(json["role"]),
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role.toJson(),
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
      };
}
