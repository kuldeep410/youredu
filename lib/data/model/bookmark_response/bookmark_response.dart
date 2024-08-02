// To parse this JSON data, do
//
//     final bookmarkResponse = bookmarkResponseFromJson(jsonString);

import 'dart:convert';

BookmarkResponse bookmarkResponseFromJson(String str) => BookmarkResponse.fromJson(json.decode(str));

String bookmarkResponseToJson(BookmarkResponse data) => json.encode(data.toJson());

class BookmarkResponse {
    bool? result;
    String? message;
    Data? data;

    BookmarkResponse({
        this.result,
        this.message,
        this.data,
    });

    factory BookmarkResponse.fromJson(Map<String, dynamic> json) => BookmarkResponse(
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
    Data();

    factory Data.fromJson(Map<String, dynamic> json) => Data(
    );

    Map<String, dynamic> toJson() => {
    };
}
