import 'dart:convert';

CourseAvailable courseAvailableFromJson(String str) => CourseAvailable.fromJson(json.decode(str));

String courseAvailableToJson(CourseAvailable data) => json.encode(data.toJson());

class CourseAvailable {
    int id;
    Instructor instructor;
    Course courseType;
    Course courseStatus;
    DateTime startDate;
    DateTime dueDate;
    String startTime;
    String endTime;
    String name;
    String price;
    String description;
    bool available;

    CourseAvailable({
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
        required this.available,
    });

    factory CourseAvailable.fromJson(Map<String, dynamic> json) => CourseAvailable(
        id: json["id"],
        instructor: Instructor.fromJson(json["instructor"]),
        courseType: Course.fromJson(json["course_type"]),
        courseStatus: Course.fromJson(json["course_status"]),
        startDate: DateTime.parse(json["start_date"]),
        dueDate: DateTime.parse(json["due_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        available: json["available"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "instructor": instructor.toJson(),
        "course_type": courseType.toJson(),
        "course_status": courseStatus.toJson(),
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "due_date": "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "name": name,
        "price": price,
        "description": description,
        "available": available,
    };
}

class Course {
    int id;
    String name;
    String description;
    String? code;

    Course({
        required this.id,
        required this.name,
        required this.description,
        this.code,
    });

    factory Course.fromJson(Map<String, dynamic> json) => Course(
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
    dynamic birthdate;
    String profileImage;

    Instructor({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.birthdate,
        required this.profileImage,
    });

    factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        birthdate: json["birthdate"],
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "birthdate": birthdate,
        "profile_image": profileImage,
    };
}