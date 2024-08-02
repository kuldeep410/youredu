// To parse this JSON data, do
//
//     final sliderResponse = sliderResponseFromJson(jsonString);

import 'dart:convert';

SliderResponse sliderResponseFromJson(String str) =>
    SliderResponse.fromJson(json.decode(str));

String sliderResponseToJson(SliderResponse data) => json.encode(data.toJson());

class SliderResponse {
  SliderResponse({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  bool? success;
  String? status;
  String? message;
  List<SliderList>? data;

  factory SliderResponse.fromJson(Map<String, dynamic> json) => SliderResponse(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        data: json["data"] != null ?List<SliderList>.from(json["data"].map((x) => SliderList.fromJson(x))) : null,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SliderList {
  SliderList({
    this.id,
    this.title,
    this.image,
  });

  int? id;
  String? title;
  String? image;

  factory SliderList.fromJson(Map<String, dynamic> json) => SliderList(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}
