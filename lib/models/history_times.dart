import 'package:swimmast_movil/models/styles.dart';

class HistoryTimes {
    final int id;
    final Styles style;
    final String time;
    final String meters;
    final int swimmer;

    HistoryTimes({
        required this.id,
        required this.style,
        required this.time,
        required this.meters,
        required this.swimmer,
    });

    factory HistoryTimes.fromJson(Map<String, dynamic> json) => HistoryTimes(
        id: json["id"],
        style: Styles.fromJson(json["style"]),
        time: json["time"],
        meters: json["meters"],
        swimmer: json["swimmer"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "style": style.toJson(),
        "time": time,
        "meters": meters,
        "swimmer": swimmer,
    };
}

