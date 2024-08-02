// To parse this JSON data, do
//
//     final badgeMentorsResponse = badgeMentorsResponseFromJson(jsonString);

import 'dart:convert';

BadgeMentorsResponse badgeMentorsResponseFromJson(String str) =>
    BadgeMentorsResponse.fromJson(json.decode(str));

String badgeMentorsResponseToJson(BadgeMentorsResponse data) =>
    json.encode(data.toJson());

class BadgeMentorsResponse {
  BadgeMentorsResponse({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  bool? success;
  String? status;
  String? message;
  Data? data;

  factory BadgeMentorsResponse.fromJson(Map<String, dynamic> json) =>
      BadgeMentorsResponse(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.user,
  });

  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class User {
  User({
    this.coursesCount,
    this.totalSaleCount,
    this.studentsCount,
    this.badges,
  });

  int? coursesCount;
  int? totalSaleCount;
  int? studentsCount;
  List<Badge>? badges;

  factory User.fromJson(Map<String, dynamic> json) => User(
        coursesCount: json["courses_count"],
        totalSaleCount: json["total_sale_count"],
        studentsCount: json["students_count"],
        badges: List<Badge>.from(json["badges"].map((x) => Badge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "courses_count": coursesCount,
        "total_sale_count": totalSaleCount,
        "students_count": studentsCount,
        "badges": List<dynamic>.from(badges!.map((x) => x.toJson())),
      };
}

class Badge {
  Badge({
    this.id,
    this.title,
    this.type,
    this.condition,
    this.image,
    this.locale,
    this.description,
    this.createdAt,
  });

  int? id;
  String? title;
  String? type;
  String? condition;
  String? image;
  String? locale;
  String? description;
  int? createdAt;

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        condition: json["condition"],
        image: json["image"],
        locale: json["locale"],
        description: json["description"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "condition": condition,
        "image": image,
        "locale": locale,
        "description": description,
        "created_at": createdAt,
      };
}
