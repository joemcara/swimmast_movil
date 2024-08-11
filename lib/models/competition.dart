import 'package:swimmast_movil/models/styles.dart';

class Competition {
    final int id;
    final Styles style;
    final String name;
    final String time;
    final String meters;

    Competition({
        required this.id,
        required this.style,
        required this.name,
        required this.time,
        required this.meters,
    });

    factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        id: json["id"],
        style: Styles.fromJson(json["style"]),
        name: json["name"],
        time: json["time"],
        meters: json["meters"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "style": style.toJson(),
        "name": name,
        "time": time,
        "meters": meters,
    };
}