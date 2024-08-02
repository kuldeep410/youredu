// To parse this JSON data, do
//
//     final mentorsResponse = mentorsResponseFromJson(jsonString);

import 'dart:convert';

MentorsResponse mentorsResponseFromJson(String str) =>
    MentorsResponse.fromJson(json.decode(str));

String mentorsResponseToJson(MentorsResponse data) =>
    json.encode(data.toJson());

class MentorsResponse {
  bool? result;
  String? message;
  Data? data;

  MentorsResponse({
    this.result,
    this.message,
    this.data,
  });

  factory MentorsResponse.fromJson(Map<String, dynamic> json) =>
      MentorsResponse(
        result: json["result"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  List<Instructor>? instructors;

  Data({
    this.instructors,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        instructors: json["instructors"] == null
            ? []
            : List<Instructor>.from(
                json["instructors"]!.map((x) => Instructor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "instructors": instructors == null
            ? []
            : List<dynamic>.from(instructors!.map((x) => x.toJson())),
      };
}

class Instructor {
  int? id;
  String? name;
  String? role;
  String? email;
  String? bio;
  double? rating;
  String? image;

  Instructor({
    this.id,
    this.name,
    this.role,
    this.email,
    this.bio,
    this.rating,
    this.image,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        id: json["id"],
        name: json["name"],
        role: json["role"],
        email: json["email"],
        bio: json["bio"],
        rating: double.tryParse(json["rating"].toString()),
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
        "email": email,
        "bio": bio,
        "rating": rating,
        "Image": image,
      };
}
