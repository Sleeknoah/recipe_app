import 'dart:convert';

List<FreezerResponse> freezerFromJson(String str) => List<FreezerResponse>.from(
    json.decode(str).map((x) => FreezerResponse.fromJson(x)));

class FreezerResponse {
  final String title;
  final DateTime useBy;

  FreezerResponse({
    required this.title,
    required this.useBy,
  });

  factory FreezerResponse.fromJson(Map<String, dynamic> json) =>
      FreezerResponse(
        title: json["title"],
        useBy: DateTime.parse(json["use-by"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "use-by":
            "${useBy.year.toString().padLeft(4, '0')}-${useBy.month.toString().padLeft(2, '0')}-${useBy.day.toString().padLeft(2, '0')}",
      };
}
