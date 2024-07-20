// To parse this JSON data, do
//
//     final member = memberFromJson(jsonString);

import 'dart:convert';

Member memberFromJson(String str) => Member.fromJson(json.decode(str));

String memberToJson(Member data) => json.encode(data.toJson());

class Member {
    User user;
    String message;
    String token;
    int roleId;
    String roleName;
    String device;

    Member({
        required this.user,
        required this.message,
        required this.token,
        required this.roleId,
        required this.roleName,
        required this.device,
    });

    factory Member.fromJson(Map<String, dynamic> json) => Member(
        user: User.fromJson(json["user"]),
        message: json["message"],
        token: json["token"],
        roleId: json["role_id"],
        roleName: json["role_name"],
        device: json["device"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "message": message,
        "token": token,
        "role_id": roleId,
        "role_name": roleName,
        "device": device,
    };
}

class User {
    int id;
    dynamic representative;
    String firstName;
    String lastName;
    DateTime birthdate;

    User({
        required this.id,
        required this.representative,
        required this.firstName,
        required this.lastName,
        required this.birthdate,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        representative: json["representative"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        birthdate: DateTime.parse(json["birthdate"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "representative": representative,
        "first_name": firstName,
        "last_name": lastName,
        "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    };
}
