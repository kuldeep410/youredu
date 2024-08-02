// To parse this JSON data, do
//
//     final assignmentResponse = assignmentResponseFromJson(jsonString);

import 'dart:convert';

AssignmentResponse assignmentResponseFromJson(String str) => AssignmentResponse.fromJson(json.decode(str));

String assignmentResponseToJson(AssignmentResponse data) => json.encode(data.toJson());

class AssignmentResponse {
    bool? result;
    String? message;
    Data? data;

    AssignmentResponse({
        this.result,
        this.message,
        this.data,
    });

    factory AssignmentResponse.fromJson(Map<String, dynamic> json) => AssignmentResponse(
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
    List<Assignment>? assignments;

    Data({
        this.assignments,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        assignments: json["assignments"] == null ? [] : List<Assignment>.from(json["assignments"]!.map((x) => Assignment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "assignments": assignments == null ? [] : List<dynamic>.from(assignments!.map((x) => x.toJson())),
    };
}

class Assignment {
    int? id;
    String? title;
    String? details;
    String? courseTitle;
    int? marks;
    String? deadline;
    String? status;

    Assignment({
        this.id,
        this.title,
        this.details,
        this.courseTitle,
        this.marks,
        this.deadline,
        this.status,
    });

    factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json["id"],
        title: json["title"],
        details: json["details"],
        courseTitle: json["course_title"],
        marks: json["marks"],
        deadline: json["deadline"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "details": details,
        "course_title": courseTitle,
        "marks": marks,
        "deadline": deadline,
        "status": status,
    };
}
