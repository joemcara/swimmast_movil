
class HistoryRoutines {
    final int id;
    final String name;
    final String day;
    final String time;
    final bool performed;

    HistoryRoutines({
        required this.id,
        required this.name,
        required this.day,
        required this.time,
        required this.performed,
    });

    factory HistoryRoutines.fromJson(Map<String, dynamic> json) => HistoryRoutines(
        id: json["id"],
        name: json["name"],
        day: json["day"],
        time: json["time"],
        performed: json["performed"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "day": day,
        "time": time,
        "performed": performed,
    };
}
