// To parse this JSON data, do
//
//     final responseVerificationField = responseVerificationFieldFromJson(jsonString);

import 'dart:convert';

ResponseVerificationField responseVerificationFieldFromJson(String str) =>
    ResponseVerificationField.fromJson(json.decode(str));

String responseVerificationFieldToJson(ResponseVerificationField data) =>
    json.encode(data.toJson());

class ResponseVerificationField {
  bool? result;
  String? message;
  Data? data;

  ResponseVerificationField({
    this.result,
    this.message,
    this.data,
  });

  factory ResponseVerificationField.fromJson(Map<String, dynamic> json) =>
      ResponseVerificationField(
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

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
