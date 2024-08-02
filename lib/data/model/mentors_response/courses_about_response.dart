// To parse this JSON data, do
//
//     final coursesMentorsResponse = coursesMentorsResponseFromJson(jsonString);

import 'dart:convert';

CoursesMentorsResponse coursesMentorsResponseFromJson(String str) =>
    CoursesMentorsResponse.fromJson(json.decode(str));

String coursesMentorsResponseToJson(CoursesMentorsResponse data) =>
    json.encode(data.toJson());

class CoursesMentorsResponse {
  CoursesMentorsResponse({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  bool? success;
  String? status;
  String? message;
  Data? data;

  factory CoursesMentorsResponse.fromJson(Map<String, dynamic> json) =>
      CoursesMentorsResponse(
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
    this.courses,
  });

  int? coursesCount;
  int? totalSaleCount;
  int? studentsCount;
  List<Course>? courses;

  factory User.fromJson(Map<String, dynamic> json) => User(
        coursesCount: json["courses_count"],
        totalSaleCount: json["total_sale_count"],
        studentsCount: json["students_count"],
        courses:
            List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "courses_count": coursesCount,
        "total_sale_count": totalSaleCount,
        "students_count": studentsCount,
        "courses": List<dynamic>.from(courses!.map((x) => x.toJson())),
      };
}

class Course {
  Course({
    this.id,
    this.title,
    this.price,
    this.priceWithDiscount,
    this.discount,
    this.duration,
    this.teacher,
    this.rate,
    this.reviewsCount,
    this.image,
  });

  int? id;
  String? title;
  String? price;
  String? priceWithDiscount;
  String? discount;
  int? duration;
  String? teacher;
  String? rate;
  int? reviewsCount;
  String? image;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        priceWithDiscount: json["price_with_discount"],
        discount: json["discount"],
        duration: json["duration"],
        teacher: json["teacher"],
        rate: json["rate"],
        reviewsCount: json["reviews_count"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "price_with_discount": priceWithDiscount,
        "discount": discount,
        "duration": duration,
        "teacher": teacher,
        "rate": rate,
        "reviews_count": reviewsCount,
        "image": image,
      };
}
