import 'dart:convert';

List<Courseinstructor> courseFromJson(String str) =>
    List<Courseinstructor>.from(
        json.decode(str).map((x) => Courseinstructor.fromJson(x)));

String courseToJson(List<Courseinstructor> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Courseinstructor {
  int id;
  Instructor instructor;
  CourseType courseType;
  CourseStatus courseStatus;
  DateTime startDate;
  DateTime dueDate;
  String startTime;
  String endTime;
  String name;
  String price;
  String description;
  bool available;
  List<String> weekdays;

  Courseinstructor(
      {required this.id,
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
      required this.available,
      required this.weekdays});

  factory Courseinstructor.fromJson(Map<String, dynamic> json) =>
      Courseinstructor(
          id: json["id"],
          instructor: Instructor.fromJson(json["instructor"]),
          courseType: CourseType.fromJson(json["course_type"]),
          courseStatus: CourseStatus.fromJson(json["course_status"]),
          startDate: DateTime.parse(json["start_date"]),
          dueDate: DateTime.parse(json["due_date"]),
          startTime: json["start_time"].substring(0, 5),
          endTime: json["end_time"],
          name: json["name"],
          price: json["price"],
          description: json["description"],
          available: json["available"],
          weekdays: List<String>.from(json["weekdays"].map((x) => x) ?? []));

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
        "available": available,
        "weekdays": List<dynamic>.from(weekdays.map((x) => x))
      };
}

class CourseStatus {
  int id;
  String name;
  String description;

  CourseStatus({
    required this.id,
    required this.name,
    required this.description,
  });

  factory CourseStatus.fromJson(Map<String, dynamic> json) => CourseStatus(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}

class CourseType {
  int id;
  String name;
  String? code;
  String description;

  CourseType({
    required this.id,
    required this.name,
    required this.description,
    required this.code,
  });

  factory CourseType.fromJson(Map<String, dynamic> json) => CourseType(
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
  String firstName;
  String lastName;

  Instructor({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
      };
}
