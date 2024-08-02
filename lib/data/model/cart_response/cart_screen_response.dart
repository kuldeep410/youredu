// To parse this JSON data, do
//
//     final cartResponse = cartResponseFromJson(jsonString);

import 'dart:convert';

CartResponse cartResponseFromJson(String str) =>
    CartResponse.fromJson(json.decode(str));

String cartResponseToJson(CartResponse data) => json.encode(data.toJson());

class CartResponse {
  CartResponse({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  bool? success;
  String? status;
  String? message;
  Data? data;

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
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
    this.cart,
  });

  Cart? cart;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cart: json["cart"] != null ? Cart.fromJson(json["cart"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "cart": cart?.toJson(),
      };
}

class Cart {
  Cart({
    this.items,
    this.amounts,
    this.userGroup,
  });

  List<Item>? items;
  Amounts? amounts;
  dynamic userGroup;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        amounts: Amounts.fromJson(json["amounts"]),
        userGroup: json["user_group"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "amounts": amounts!.toJson(),
        "user_group": userGroup,
      };
}

class Amounts {
  Amounts({
    this.subTotal,
    this.totalDiscount,
    this.tax,
    this.taxPrice,
    this.commission,
    this.commissionPrice,
    this.total,
  });

  int? subTotal;
  int? totalDiscount;
  String? tax;
  double? taxPrice;
  int? commission;
  double? commissionPrice;
  double? total;

  factory Amounts.fromJson(Map<String, dynamic> json) => Amounts(
        subTotal: json["sub_total"],
        totalDiscount: json["total_discount"],
        tax: json["tax"],
        taxPrice: json["tax_price"].toDouble(),
        commission: json["commission"],
        commissionPrice: json["commission_price"].toDouble(),
        total: json["total"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "sub_total": subTotal,
        "total_discount": totalDiscount,
        "tax": tax,
        "tax_price": taxPrice,
        "commission": commission,
        "commission_price": commissionPrice,
        "total": total,
      };
}

class Item {
  Item({
    this.id,
    this.user,
    this.webinar,
    this.price,
    this.discount,
    this.meeting,
  });

  int? id;
  User? user;
  Webinar? webinar;
  int? price;
  int? discount;
  dynamic meeting;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        user: User.fromJson(json["user"]),
        webinar: Webinar.fromJson(json["webinar"]),
        price: json["price"],
        discount: json["discount"],
        meeting: json["meeting"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "webinar": webinar?.toJson(),
        "price": price,
        "discount": discount,
        "meeting": meeting,
      };
}

class User {
  User({
    this.id,
    this.fullName,
    this.email,
    this.mobile,
    this.rate,
    this.avatar,
  });

  int? id;
  String? fullName;
  String? email;
  String? mobile;
  int? rate;
  String? avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        mobile: json["mobile"],
        rate: json["rate"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "mobile": mobile,
        "rate": rate,
        "avatar": avatar,
      };
}

class Webinar {
  Webinar({
    this.id,
    this.title,
    this.authHasBought,
    this.isFavorite,
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
    this.studentsCount,
    this.image,
    this.videoDemo,
    this.description,
  });

  int? id;
  String? title;
  bool? authHasBought;
  bool? isFavorite;
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
  int? studentsCount;
  String? image;
  String? videoDemo;
  String? description;

  factory Webinar.fromJson(Map<String, dynamic> json) => Webinar(
        id: json["id"],
        title: json["title"],
        authHasBought: json["auth_has_bought"],
        isFavorite: json["is_favorite"],
        price: json["price"],
        priceWithDiscount: json["price_with_discount"],
        discount: json["discount"],
        duration: json["duration"],
        teacher: json["teacher"],
        teacherEmail: json["teacher_email"],
        teacherMobile: json["teacher_mobile"],
        teacherBio: json["teacher_bio"],
        teacherRate: json["teacher_rate"],
        avatar: json["avatar"],
        rate: json["rate"],
        reviewsCount: json["reviews_count"],
        studentsCount: json["students_count"],
        image: json["image"],
        videoDemo: json["video_demo"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "auth_has_bought": authHasBought,
        "is_favorite": isFavorite,
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
        "students_count": studentsCount,
        "image": image,
        "video_demo": videoDemo,
        "description": description,
      };
}
