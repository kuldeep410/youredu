// To parse this JSON data, do
//
//     final updatePasswordResponse = updatePasswordResponseFromJson(jsonString);

import 'dart:convert';

UpdatePasswordResponse updatePasswordResponseFromJson(String str) =>
    UpdatePasswordResponse.fromJson(json.decode(str));

String updatePasswordResponseToJson(UpdatePasswordResponse data) =>
    json.encode(data.toJson());

class UpdatePasswordResponse {
  bool? result;
  String? message;
  Data? data;

  UpdatePasswordResponse({
    this.result,
    this.message,
    this.data,
  });

  factory UpdatePasswordResponse.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordResponse(
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
