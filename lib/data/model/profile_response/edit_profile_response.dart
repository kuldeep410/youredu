// To parse this JSON data, do
//
//     final editProfileResponse = editProfileResponseFromJson(jsonString);

import 'dart:convert';

EditProfileResponse editProfileResponseFromJson(String str) =>
    EditProfileResponse.fromJson(json.decode(str));

String editProfileResponseToJson(EditProfileResponse data) =>
    json.encode(data.toJson());

class EditProfileResponse {
  bool? result;
  String? message;
  Data? data;

  EditProfileResponse({
    this.result,
    this.message,
    this.data,
  });

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) =>
      EditProfileResponse(
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

  Data({
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
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

  User({
    this.userId,
    this.name,
    this.email,
    this.mobile,
    this.avatar,
    this.statusId,
    this.status,
    this.dateOfBirth,
    this.joinDate,
  });

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
      };
}
