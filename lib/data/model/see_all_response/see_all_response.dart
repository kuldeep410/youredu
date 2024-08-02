import 'dart:convert';

SeeAllResponse seeAllResponseFromJson(String str) => SeeAllResponse.fromJson(json.decode(str));

String seeAllResponseToJson(SeeAllResponse data) => json.encode(data.toJson());

class SeeAllResponse {
    bool? result;
    String? message;
    List<Datum>? data;

    SeeAllResponse({
        this.result,
        this.message,
        this.data,
    });

    factory SeeAllResponse.fromJson(Map<String, dynamic> json) => SeeAllResponse(
        result: json["result"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? title;
    int? price;
    int? discountPrice;
    String? image;
    int? rate;
    int? totalSales;
    int? reviewCount;
    int? isFree;
    int? isDiscount;
    DateTime? createdAt;
    String? courseCreator;
    String? details;
    bool? isBookmark;
    bool? isPurchased;

    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        discountPrice: json["discount_price"],
        image: json["image"],
        rate: json["rate"],
        totalSales: json["total_sales"],
        reviewCount: json["reviewCount"],
        isFree: json["is_free"],
        isDiscount: json["is_discount"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
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
