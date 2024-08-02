// To parse this JSON data, do
//
//     final seeAllCategoryRresponse = seeAllCategoryRresponseFromJson(jsonString);

import 'dart:convert';

SeeAllCategoryRresponse seeAllCategoryRresponseFromJson(String str) =>
    SeeAllCategoryRresponse.fromJson(json.decode(str));

String seeAllCategoryRresponseToJson(SeeAllCategoryRresponse data) =>
    json.encode(data.toJson());

class SeeAllCategoryRresponse {
  SeeAllCategoryRresponse({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  bool? success;
  String? status;
  String? message;
  Data? data;

  factory SeeAllCategoryRresponse.fromJson(Map<String, dynamic> json) =>
      SeeAllCategoryRresponse(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.count,
    this.categories,
  });

  int? count;
  List<Category>? categories;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.title,
    this.color,
    this.icon,
  });

  int? id;
  String? title;
  String? color;
  String? icon;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        color: json["color"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "color": color,
        "icon": icon,
      };
}
