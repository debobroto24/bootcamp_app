import 'dart:convert';

Favorites favoritesFromJson(String str) => Favorites.fromJson(json.decode(str));

String favoritesToJson(Favorites data) => json.encode(data.toJson());

class Favorites {
  Favorites({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum> data;

  factory Favorites.fromJson(Map<String, dynamic> json) => Favorites(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.description,
    required this.isFavorite,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String title;
  String subtitle;
  String image;
  String description;
  int isFavorite;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        image: json["image"],
        description: json["description"],
        isFavorite: json["is_favorite"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "image": image,
        "description": description,
        "is_favorite": isFavorite,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
