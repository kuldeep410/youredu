// To parse this JSON data, do
//
//     final courseDetailsResponse = courseDetailsResponseFromJson(jsonString);

import 'dart:convert';

CourseDetailsResponse courseDetailsResponseFromJson(String str) =>
    CourseDetailsResponse.fromJson(json.decode(str));

String courseDetailsResponseToJson(CourseDetailsResponse data) =>
    json.encode(data.toJson());

class CourseDetailsResponse {
  bool? result;
  String? message;
  Data? data;

  CourseDetailsResponse({
    this.result,
    this.message,
    this.data,
  });

  factory CourseDetailsResponse.fromJson(Map<String, dynamic> json) =>
      CourseDetailsResponse(
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
  Details? details;
  List<Curriculum>? curriculum;

  Data({
    this.details,
    this.curriculum,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        details:
            json["details"] == null ? null : Details.fromJson(json["details"]),
        curriculum: json["curriculum"] == null
            ? []
            : List<Curriculum>.from(
                json["curriculum"]!.map((x) => Curriculum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "details": details?.toJson(),
        "curriculum": curriculum == null
            ? []
            : List<dynamic>.from(curriculum!.map((x) => x.toJson())),
      };
}

class Curriculum {
  int? id;
  String? sectionName;
  List<Lesson>? lessons;

  Curriculum({
    this.id,
    this.sectionName,
    this.lessons,
  });

  factory Curriculum.fromJson(Map<String, dynamic> json) => Curriculum(
        id: json["id"],
        sectionName: json["section_name"],
        lessons: json["lessons"] == null
            ? []
            : List<Lesson>.from(
                json["lessons"]!.map((x) => Lesson.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "section_name": sectionName,
        "lessons": lessons == null
            ? []
            : List<dynamic>.from(lessons!.map((x) => x.toJson())),
      };
}

class Lesson {
  int? id;
  String? title;
  int? isQuiz;
  String? lessonType;

  Lesson({this.id, this.title, this.isQuiz, this.lessonType});

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json["id"],
        title: json["title"],
        isQuiz: json["is_quiz"],
        lessonType: json["lesson_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "is_quiz": isQuiz,
        "lesson_type": lessonType,
      };
}

class Details {
  int? id;
  String? title;
  String? thumbnailImage;
  String? videoUrl;
  String? creatorImg;
  String? creatorName;
  String? creatorTitle;
  double? rating;
  int? ratingsCount;
  int? studentCount;
  String? courseShortDescription;
  int? price;
  int? isDiscount;
  int? discountType;
  int? discountPrice;
  String? createdAt;
  String? learnDescription;
  bool? isBookmark;
  bool? isPurchased;
  String? slug;
  String? requirements;

  Details({
    this.id,
    this.title,
    this.thumbnailImage,
    this.videoUrl,
    this.creatorImg,
    this.creatorName,
    this.creatorTitle,
    this.rating,
    this.ratingsCount,
    this.studentCount,
    this.courseShortDescription,
    this.price,
    this.isDiscount,
    this.discountType,
    this.discountPrice,
    this.createdAt,
    this.learnDescription,
    this.isBookmark,
    this.isPurchased,
    this.slug,
    this.requirements,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["id"],
        title: json["title"],
        thumbnailImage: json["thumbnail_image"],
        videoUrl: json["video_url"],
        creatorImg: json["creator_img"],
        creatorName: json["creator_name"],
        creatorTitle: json["creator_title"],
        rating: double.tryParse(json["rating"].toString()),
        ratingsCount: json["ratings_count"],
        studentCount: json["student_count"],
        courseShortDescription: json["course_short_description"],
        price: json["price"],
        isDiscount: json["is_discount"],
        discountType: json["discount_type"],
        discountPrice: json["discount_price"],
        createdAt: json["created_at"],
        learnDescription: json["learn_description"],
        isBookmark: json["is_bookmark"],
        isPurchased: json["is_purchased"],
        slug: json["slug"],
        requirements: json["requirements"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "thumbnail_image": thumbnailImage,
        "video_url": videoUrl,
        "creator_img": creatorImg,
        "creator_name": creatorName,
        "creator_title": creatorTitle,
        "rating": rating,
        "ratings_count": ratingsCount,
        "student_count": studentCount,
        "course_short_description": courseShortDescription,
        "price": price,
        "is_discount": isDiscount,
        "discount_type": discountType,
        "discount_price": discountPrice,
        "created_at": createdAt,
        "learn_description": learnDescription,
        "is_bookmark": isBookmark,
        "is_purchased": isPurchased,
        "slug": slug,
        "requirements": requirements,
      };
}
