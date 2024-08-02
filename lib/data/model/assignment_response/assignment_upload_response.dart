// To parse this JSON data, do
//
//     final assignmentUploadResponse = assignmentUploadResponseFromJson(jsonString);

import 'dart:convert';

AssignmentUploadResponse assignmentUploadResponseFromJson(String str) =>
    AssignmentUploadResponse.fromJson(json.decode(str));

String assignmentUploadResponseToJson(AssignmentUploadResponse data) =>
    json.encode(data.toJson());

class AssignmentUploadResponse {
  bool? result;
  String? message;
  Data? data;

  AssignmentUploadResponse({
    this.result,
    this.message,
    this.data,
  });

  factory AssignmentUploadResponse.fromJson(Map<String, dynamic> json) =>
      AssignmentUploadResponse(
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
