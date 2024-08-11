import 'package:swimmast_movil/models/competition.dart';


class CompetitionsInfo {
    final int id;
    final Competition competition;
    final String time;
    final DateTime date;
    final int swimmer;

    CompetitionsInfo({
        required this.id,
        required this.competition,
        required this.time,
        required this.date,
        required this.swimmer,
    });

    factory CompetitionsInfo.fromJson(Map<String, dynamic> json) => CompetitionsInfo(
        id: json["id"],
        competition: Competition.fromJson(json["competition"]),
        time: json["time"],
        date: DateTime.parse(json["date"]),
        swimmer: json["swimmer"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "competition": competition.toJson(),
        "time": time,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "swimmer": swimmer,
    };
}
