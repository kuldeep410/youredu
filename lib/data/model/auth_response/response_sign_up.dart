// To parse this JSON data, do
//
//     final responseSignUp = responseSignUpFromJson(jsonString);

import 'dart:convert';

ResponseSignUp responseSignUpFromJson(String str) =>
    ResponseSignUp.fromJson(json.decode(str));

String responseSignUpToJson(ResponseSignUp data) => json.encode(data.toJson());

class ResponseSignUp {
  bool? result;
  String? message;
  Data? data;

  ResponseSignUp({
    this.result,
    this.message,
    this.data,
  });

  factory ResponseSignUp.fromJson(Map<String, dynamic> json) => ResponseSignUp(
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
  User? user;
  String? token;

  Data({
    this.user,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "token": token,
      };
}

class User {
  String? name;
  String? email;
  String? phone;
  int? roleId;
  int? token;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  User({
    this.name,
    this.email,
    this.phone,
    this.roleId,
    this.token,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        roleId: json["role_id"],
        token: json["token"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "role_id": roleId,
        "token": token,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
