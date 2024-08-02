// To parse this JSON data, do
//
//     final categoryCourseListResponse = categoryCourseListResponseFromJson(jsonString);

import 'dart:convert';

CategoryCourseListResponse categoryCourseListResponseFromJson(String str) =>
    CategoryCourseListResponse.fromJson(json.decode(str));

String categoryCourseListResponseToJson(CategoryCourseListResponse data) =>
    json.encode(data.toJson());

class CategoryCourseListResponse {
  bool? result;
  String? message;
  Data? data;

  CategoryCourseListResponse({
    this.result,
    this.message,
    this.data,
  });

  factory CategoryCourseListResponse.fromJson(Map<String, dynamic> json) =>
      CategoryCourseListResponse(
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
  Category? category;
  List<Course>? courses;

  Data({
    this.category,
    this.courses,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        courses: json["courses"] == null
            ? []
            : List<Course>.from(
                json["courses"]!.map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category?.toJson(),
        "courses": courses == null
            ? []
            : List<dynamic>.from(courses!.map((x) => x.toJson())),
      };
}

class Category {
  int? id;
  String? title;
  String? slug;
  String? icon;

  Category({
    this.id,
    this.title,
    this.slug,
    this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "icon": icon,
      };
}

class Course {
  int? id;
  String? title;
  int? price;
  int? discountPrice;
  String? image;
  double? rate;
  int? totalSales;
  int? reviewCount;
  int? isFree;
  int? isDiscount;
  DateTime? createdAt;
  String? courseCreator;
  String? details;
  bool? isBookmark;
  bool? isPurchased;

  Course({
    this.id,
    this.title,
    this.price,
    this.discountPrice,
    this.image,
    this.rate,
    this.totalSales,
    this.reviewCount,
    this.isFree,
    this.isDiscount,
    this.createdAt,
    this.courseCreator,
    this.details,
    this.isBookmark,
    this.isPurchased,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        discountPrice: json["discount_price"],
        image: json["image"],
        rate: double.tryParse(json["rate"].toString()),
        totalSales: json["total_sales"],
        reviewCount: json["reviewCount"],
        isFree: json["is_free"],
        isDiscount: json["is_discount"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        courseCreator: json["course_creator"],
        details: json["details"],
        isBookmark: json["is_bookmark"],
        isPurchased: json["is_purchased"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "discount_price": discountPrice,
        "image": image,
        "rate": rate,
        "total_sales": totalSales,
        "reviewCount": reviewCount,
        "is_free": isFree,
        "is_discount": isDiscount,
        "created_at": createdAt?.toIso8601String(),
        "course_creator": courseCreator,
        "details": details,
        "is_bookmark": isBookmark,
        "is_purchased": isPurchased,
      };
}
