// To parse this JSON data, do
//
//     final responseLogin = responseLoginFromJson(jsonString);

import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) =>
    ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  bool? result;
  String? message;
  Data? data;

  ResponseLogin({
    this.result,
    this.message,
    this.data,
  });

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
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
  int? userId;
  String? name;
  String? email;
  String? mobile;
  String? avatar;
  int? statusId;
  String? status;
  DateTime? dateOfBirth;
  String? joinDate;
  String? verificationSetup;

  User(
      {this.userId,
      this.name,
      this.email,
      this.mobile,
      this.avatar,
      this.statusId,
      this.status,
      this.dateOfBirth,
      this.joinDate,
      this.verificationSetup});

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        avatar: json["avatar"],
        statusId: json["status_id"],
        status: json["status"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        joinDate: json["joinDate"],
        verificationSetup: json["verification_setup"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "email": email,
        "mobile": mobile,
        "avatar": avatar,
        "status_id": statusId,
        "status": status,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "joinDate": joinDate,
        "verification_setup": verificationSetup
      };
}
