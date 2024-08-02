// To parse this JSON data, do
//
//     final assignmentDetailsResponse = assignmentDetailsResponseFromJson(jsonString);

import 'dart:convert';

AssignmentDetailsResponse assignmentDetailsResponseFromJson(String str) =>
    AssignmentDetailsResponse.fromJson(json.decode(str));

String assignmentDetailsResponseToJson(AssignmentDetailsResponse data) =>
    json.encode(data.toJson());

class AssignmentDetailsResponse {
  bool? result;
  String? message;
  Data? data;

  AssignmentDetailsResponse({
    this.result,
    this.message,
    this.data,
  });

  factory AssignmentDetailsResponse.fromJson(Map<String, dynamic> json) =>
      AssignmentDetailsResponse(
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
  Assignment? assignment;

  Data({
    this.assignment,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        assignment: json["assignment"] == null
            ? null
            : Assignment.fromJson(json["assignment"]),
      );

  Map<String, dynamic> toJson() => {
        "assignment": assignment?.toJson(),
      };
}

class Assignment {
  int? id;
  String? title;
  String? details;
  dynamic note;
  String? courseTitle;
  int? marks;
  String? deadlineDate;
  String? deadlineTime;
  String? status;
  Instructor? instructor;
  FileClass? file;

  Assignment({
    this.id,
    this.title,
    this.details,
    this.note,
    this.courseTitle,
    this.marks,
    this.deadlineDate,
    this.deadlineTime,
    this.status,
    this.instructor,
    this.file,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json["id"],
        title: json["title"],
        details: json["details"],
        note: json["note"],
        courseTitle: json["course_title"],
        marks: json["marks"],
        deadlineDate: json["deadline_date"],
        deadlineTime: json["deadline_time"],
        status: json["status"],
        instructor: json["instructor"] == null
            ? null
            : Instructor.fromJson(json["instructor"]),
        file: json["file"] == null ? null : FileClass.fromJson(json["file"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "details": details,
        "note": note,
        "course_title": courseTitle,
        "marks": marks,
        "deadline_date": deadlineDate,
        "deadline_time": deadlineTime,
        "status": status,
        "instructor": instructor?.toJson(),
        "file": file?.toJson(),
      };
}

class FileClass {
  String? name;
  String? image;
  String? fileUrl;

  FileClass({
    this.name,
    this.image,
    this.fileUrl,
  });

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        name: json["name"],
        image: json["image"],
        fileUrl: json["file_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "file_url": fileUrl,
      };
}

class Instructor {
  String? name;
  String? image;
  String? designation;

  Instructor({
    this.name,
    this.image,
    this.designation,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        name: json["name"],
        image: json["image"],
        designation: json["designation"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "designation": designation,
      };
}
