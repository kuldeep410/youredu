import 'dart:convert';

ResponseHome responseHomeFromJson(String str) =>
    ResponseHome.fromJson(json.decode(str));

String responseHomeToJson(ResponseHome data) => json.encode(data.toJson());

class ResponseHome {
  bool? result;
  String? message;
  Data? data;

  ResponseHome({
    this.result,
    this.message,
    this.data,
  });

  factory ResponseHome.fromJson(Map<String, dynamic> json) => ResponseHome(
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
  List<Slider>? sliders;
  List<Category>? categories;
  Courses? courses;

  Data({
    this.sliders,
    this.categories,
    this.courses,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sliders: json["sliders"] == null
            ? []
            : List<Slider>.from(
                json["sliders"]!.map((x) => Slider.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        courses:
            json["courses"] == null ? null : Courses.fromJson(json["courses"]),
      );

  Map<String, dynamic> toJson() => {
        "sliders": sliders == null
            ? []
            : List<dynamic>.from(sliders!.map((x) => x.toJson())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "courses": courses?.toJson(),
      };
}

class Category {
  int? id;
  String? title;
  String? slug;
  dynamic icon;
  dynamic thumbnail;
  DateTime? createdAt;

  Category({
    this.id,
    this.title,
    this.slug,
    this.icon,
    this.thumbnail,
    this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        icon: json["icon"],
        thumbnail: json["thumbnail"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "icon": icon,
        "thumbnail": thumbnail,
        "created_at": createdAt?.toIso8601String(),
      };
}

class Courses {
  List<Course>? featuredCourses;
  List<Course>? latestCourses;
  List<Course>? bestRatedCourses;
  List<Course>? bestSellingCourses;
  List<Course>? freeCourses;
  List<Course>? discountCourses;

  Courses({
    this.featuredCourses,
    this.latestCourses,
    this.bestRatedCourses,
    this.bestSellingCourses,
    this.freeCourses,
    this.discountCourses,
  });

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        featuredCourses: json["featured_courses"] == null
            ? []
            : List<Course>.from(
                json["featured_courses"]!.map((x) => Course.fromJson(x))),
        latestCourses: json["latest_courses"] == null
            ? []
            : List<Course>.from(
                json["latest_courses"]!.map((x) => Course.fromJson(x))),
        bestRatedCourses: json["best_rated_courses"] == null
            ? []
            : List<Course>.from(
                json["best_rated_courses"]!.map((x) => Course.fromJson(x))),
        bestSellingCourses: json["best_selling_courses"] == null
            ? []
            : List<Course>.from(
                json["best_selling_courses"]!.map((x) => Course.fromJson(x))),
        freeCourses: json["free_courses"] == null
            ? []
            : List<Course>.from(
                json["free_courses"]!.map((x) => Course.fromJson(x))),
        discountCourses: json["discount_courses"] == null
            ? []
            : List<Course>.from(
                json["discount_courses"]!.map((x) => Course.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "featured_courses": featuredCourses == null
            ? []
            : List<dynamic>.from(featuredCourses!.map((x) => x.toJson())),
        "latest_courses": latestCourses == null
            ? []
            : List<dynamic>.from(latestCourses!.map((x) => x.toJson())),
        "best_rated_courses": bestRatedCourses == null
            ? []
            : List<dynamic>.from(bestRatedCourses!.map((x) => x.toJson())),
        "best_selling_courses": bestSellingCourses == null
            ? []
            : List<dynamic>.from(bestSellingCourses!.map((x) => x.toJson())),
        "free_courses": freeCourses == null
            ? []
            : List<dynamic>.from(freeCourses!.map((x) => x.toJson())),
        "discount_courses": discountCourses == null
            ? []
            : List<dynamic>.from(discountCourses!.map((x) => x.toJson())),
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

class Slider {
  int? id;
  String? title;
  String? subTitle;
  String? description;
  int? serial;
  String? image;

  Slider({
    this.id,
    this.title,
    this.subTitle,
    this.description,
    this.serial,
    this.image,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        id: json["id"],
        title: json["title"],
        subTitle: json["sub_title"],
        description: json["description"],
        serial: json["serial"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "sub_title": subTitle,
        "description": description,
        "serial": serial,
        "image": image,
      };
}
