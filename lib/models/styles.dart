// To parse this JSON data, do
//
//     final styles = stylesFromJson(jsonString);


class Styles {
    final int id;
    final String name;

    Styles({
        required this.id,
        required this.name,
    });

    factory Styles.fromJson(Map<String, dynamic> json) => Styles(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
