// To parse this JSON data, do
//
//     final notificationResponse = notificationResponseFromJson(jsonString);

import 'dart:convert';

NotificationResponse notificationResponseFromJson(String str) =>
    NotificationResponse.fromJson(json.decode(str));

String notificationResponseToJson(NotificationResponse data) =>
    json.encode(data.toJson());

class NotificationResponse {
  NotificationResponse({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  bool? success;
  String? status;
  String? message;
  Data? data;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      NotificationResponse(
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
    this.count,
    this.notifications,
  });

  int? count;
  List<Notification>? notifications;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        notifications: List<Notification>.from(
            json["notifications"].map((x) => Notification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "notifications":
            List<dynamic>.from(notifications!.map((x) => x.toJson())),
      };
}

class Notification {
  Notification({
    this.id,
    this.title,
    this.message,
    this.type,
    this.status,
    this.createdAt,
  });

  int? id;
  String? title;
  String? message;
  String? type;
  String? status;
  DateTime? createdAt;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        title: json["title"],
        message: json["message"],
        type: json["type"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "message": message,
        "type": type,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
      };
}
