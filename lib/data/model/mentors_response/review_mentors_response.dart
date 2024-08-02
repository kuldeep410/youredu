// To parse this JSON data, do
//
//     final reviewMentorsResponse = reviewMentorsResponseFromJson(jsonString);

import 'dart:convert';

ReviewMentorsResponse reviewMentorsResponseFromJson(String str) =>
    ReviewMentorsResponse.fromJson(json.decode(str));

String reviewMentorsResponseToJson(ReviewMentorsResponse data) =>
    json.encode(data.toJson());

class ReviewMentorsResponse {
  ReviewMentorsResponse({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  bool? success;
  String? status;
  String? message;
  Data? data;

  factory ReviewMentorsResponse.fromJson(Map<String, dynamic> json) =>
      ReviewMentorsResponse(
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
    this.rate,
    this.reviewsCount,
  });

  int? coursesCount;
  int? totalSaleCount;
  int? studentsCount;
  String? rate;
  int? reviewsCount;

  factory User.fromJson(Map<String, dynamic> json) => User(
        coursesCount: json["courses_count"],
        totalSaleCount: json["total_sale_count"],
        studentsCount: json["students_count"],
        rate: json["rate"],
        reviewsCount: json["reviews_count"],
      );

  Map<String, dynamic> toJson() => {
        "courses_count": coursesCount,
        "total_sale_count": totalSaleCount,
        "students_count": studentsCount,
        "rate": rate,
        "reviews_count": reviewsCount,
      };
}
