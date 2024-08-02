// To parse this JSON data, do
//
//     final sliderDetailsResponse = sliderDetailsResponseFromJson(jsonString);

import 'dart:convert';

SliderDetailsResponse sliderDetailsResponseFromJson(String str) => SliderDetailsResponse.fromJson(json.decode(str));

String sliderDetailsResponseToJson(SliderDetailsResponse data) => json.encode(data.toJson());

class SliderDetailsResponse {
  SliderDetailsResponse({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  bool? success;
  String? status;
  String? message;
  Data? data;

  factory SliderDetailsResponse.fromJson(Map<String, dynamic> json) => SliderDetailsResponse(
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
    this.id,
    this.title,
    this.image,
    this.webinars,
  });

  int? id;
  String? title;
  String? image;
  List<Webinar>? webinars;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    webinars: List<Webinar>.from(json["webinars"].map((x) => Webinar.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "webinars": List<dynamic>.from(webinars!.map((x) => x.toJson())),
  };
}

class Webinar {
  Webinar({
    this.id,
    this.price,
    this.priceWithDiscount,
    this.discount,
    this.duration,
    this.teacher,
    this.teacherEmail,
    this.teacherMobile,
    this.teacherBio,
    this.teacherRate,
    this.avatar,
    this.rate,
    this.reviewsCount,
    this.image,
    this.description,
    this.title
  });

  int? id;
  String? title;
  String? price;
  String? priceWithDiscount;
  String? discount;
  int? duration;
  String? teacher;
  String? teacherEmail;
  String? teacherMobile;
  String? teacherBio;
  String? teacherRate;
  String? avatar;
  String? rate;
  int? reviewsCount;
  String? image;
  String? description;

  factory Webinar.fromJson(Map<String, dynamic> json) => Webinar(
    id: json["id"],
    price: json["price"],
    priceWithDiscount: json["price_with_discount"],
    discount: json["discount"],
    duration: json["duration"],
    title: json["title"],
    teacher: json["teacher"],
    teacherEmail: json["teacher_email"],
    teacherMobile: json["teacher_mobile"],
    teacherBio: json["teacher_bio"],
    teacherRate: json["teacher_rate"],
    avatar: json["avatar"],
    rate: json["rate"],
    reviewsCount: json["reviews_count"],
    image: json["image"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "price_with_discount": priceWithDiscount,
    "discount": discount,
    "duration": duration,
    "teacher": teacher,
    "teacher_email": teacherEmail,
    "teacher_mobile": teacherMobile,
    "teacher_bio": teacherBio,
    "teacher_rate": teacherRate,
    "avatar": avatar,
    "rate": rate,
    "reviews_count": reviewsCount,
    "image": image,
    "description": description,
  };
}
