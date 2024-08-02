// To parse this JSON data, do
//
//     final aboutUsResponse = aboutUsResponseFromJson(jsonString);

import 'dart:convert';

AboutUsResponse aboutUsResponseFromJson(String str) =>
    AboutUsResponse.fromJson(json.decode(str));

String aboutUsResponseToJson(AboutUsResponse data) =>
    json.encode(data.toJson());

class AboutUsResponse {
  AboutUsResponse({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  bool? success;
  String? status;
  String? message;
  Data? data;

  factory AboutUsResponse.fromJson(Map<String, dynamic> json) =>
      AboutUsResponse(
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
    this.title,
    this.value,
  });

  String? title;
  String? value;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "value": value,
      };
}
