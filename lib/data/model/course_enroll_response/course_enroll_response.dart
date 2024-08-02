// To parse this JSON data, do
//
//     final courseEnrollResponse = courseEnrollResponseFromJson(jsonString);

import 'dart:convert';

CourseEnrollResponse courseEnrollResponseFromJson(String str) =>
    CourseEnrollResponse.fromJson(json.decode(str));

String courseEnrollResponseToJson(CourseEnrollResponse data) =>
    json.encode(data.toJson());

class CourseEnrollResponse {
  CourseEnrollResponse({
    this.success,
    this.status,
    this.message,
  });

  bool? success;
  String? status;
  String? message;

  factory CourseEnrollResponse.fromJson(Map<String, dynamic> json) =>
      CourseEnrollResponse(
        success: json["success"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
      };
}
