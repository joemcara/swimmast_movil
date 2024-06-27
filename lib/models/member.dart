import 'dart:convert';

Member memberFromJson(String str) => Member.fromJson(json.decode(str));

String memberToJson(Member data) => json.encode(data.toJson());

class Member {
    final User user;
    final String message;
    final String token;

    Member({
        required this.user,
        required this.message,
        required this.token,
    });

    factory Member.fromJson(Map<String, dynamic> json) => Member(
        user: User.fromJson(json["user"]),
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "message": message,
        "token": token,
    };
}

class User {
    final int id;
    final Role role;
    final Representative representative;
    final String firstName;
    final String lastName;
    final String username;
    final DateTime dateOfBirth;
    final String cellPhone;

    User({
        required this.id,
        required this.role,
        required this.representative,
        required this.firstName,
        required this.lastName,
        required this.username,
        required this.dateOfBirth,
        required this.cellPhone,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        role: Role.fromJson(json["role"]),
        representative: Representative.fromJson(json["representative"]),
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        cellPhone: json["cell_phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role": role.toJson(),
        "representative": representative.toJson(),
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "cell_phone": cellPhone,
    };
}

class Representative {
    final int id;
    final String name;
    final String relationship;

    Representative({
        required this.id,
        required this.name,
        required this.relationship,
    });

    factory Representative.fromJson(Map<String, dynamic> json) => Representative(
        id: json["id"],
        name: json["name"],
        relationship: json["relationship"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "relationship": relationship,
    };
}

class Role {
    final int id;
    final String name;
    final String description;

    Role({
        required this.id,
        required this.name,
        required this.description,
    });

    factory Role.fromJson(Map<String, dynamic> json) => Role(
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
