import 'dart:convert';

Member memberFromJson(String str) => Member.fromJson(json.decode(str));

String memberToJson(Member data) => json.encode(data.toJson());

class Member {
  UserCourse user;

  Member({
    required this.user,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        user: UserCourse.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class UserCourse {
  int id;
  dynamic representative;
  String firstName;
  String lastName;
  DateTime? birthdate;
  String profileImage;

  UserCourse({
    required this.id,
    this.representative,
    required this.firstName,
    required this.lastName,
    this.birthdate,
    required this.profileImage,
  });

  factory UserCourse.fromJson(Map<String, dynamic> json) => UserCourse(
        id: json["id"],
        representative: json["representative"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        birthdate: DateTime.parse(json["birthdate"] ?? '2024-08-08'),
        profileImage: json["profile_image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "representative": representative,
        "first_name": firstName,
        "last_name": lastName,
        "birthdate": birthdate?.toIso8601String(),
        "profile_image": profileImage,
      };
}
