// To parse this JSON data, do
//
//     final featuredCategoryResponse = featuredCategoryResponseFromJson(jsonString);

import 'dart:convert';

FeaturedCategoryResponse featuredCategoryResponseFromJson(String str) => FeaturedCategoryResponse.fromJson(json.decode(str));

String featuredCategoryResponseToJson(FeaturedCategoryResponse data) => json.encode(data.toJson());

class FeaturedCategoryResponse {
    bool? result;
    String? message;
    Data? data;

    FeaturedCategoryResponse({
        this.result,
        this.message,
        this.data,
    });

    factory FeaturedCategoryResponse.fromJson(Map<String, dynamic> json) => FeaturedCategoryResponse(
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
    List<Category>? categories;

    Data({
        this.categories,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
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
