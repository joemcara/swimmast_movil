import 'dart:convert';

Member memberFromJson(String str) => Member.fromJson(json.decode(str));

String memberToJson(Member data) => json.encode(data.toJson());

class Member {
  User user;
  int roleId;
  String roleName;
  String message;
  String token;
  String device;

  Member({
    required this.user,
    required this.roleId,
    required this.roleName,
    required this.message,
    required this.token,
    required this.device,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        user: User.fromJson(json["user"]),
        roleId: json["role_id"],
        roleName: json["role_name"],
        message: json["message"],
        token: json["token"],
        device: json["device"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "role_id": roleId,
        "role_name": roleName,
        "message": message,
        "token": token,
        "device": device,
      };
}

class User {
  int id;
  dynamic representative;
  String firstName;
  String lastName;
  DateTime birthdate;
  String profileImage;
  String phoneNumber;
  String username;

  User({
    required this.id,
    required this.representative,
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.profileImage,
    required this.phoneNumber,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        representative: json["representative"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        birthdate: DateTime.parse(json["birthdate"] ?? '2024-08-08'),
        profileImage: json["profile_image"],
        phoneNumber: json["phone_number"] ?? '00000000',
        username: json["username"] ?? 'username',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "representative": representative,
        "first_name": firstName,
        "last_name": lastName,
        "birthdate":
            "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
        "profile_image": profileImage,
        "phone_number": phoneNumber,
        "username": username,
      };
}
