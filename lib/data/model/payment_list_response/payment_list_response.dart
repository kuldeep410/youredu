// To parse this JSON data, do
//
//     final paymentListResponse = paymentListResponseFromJson(jsonString);

import 'dart:convert';

PaymentListResponse paymentListResponseFromJson(String str) => PaymentListResponse.fromJson(json.decode(str));

String paymentListResponseToJson(PaymentListResponse data) => json.encode(data.toJson());

class PaymentListResponse {
    bool? result;
    String? message;
    Data? data;

    PaymentListResponse({
        this.result,
        this.message,
        this.data,
    });

    factory PaymentListResponse.fromJson(Map<String, dynamic> json) => PaymentListResponse(
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
    List<Payment>? payments;

    Data({
        this.payments,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        payments: json["payments"] == null ? [] : List<Payment>.from(json["payments"]!.map((x) => Payment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "payments": payments == null ? [] : List<dynamic>.from(payments!.map((x) => x.toJson())),
    };
}

class Payment {
    int? id;
    String? title;
    String? name;
    String? image;

    Payment({
        this.id,
        this.title,
        this.name,
        this.image,
    });

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        title: json["title"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "name": name,
        "image": image,
    };
}
