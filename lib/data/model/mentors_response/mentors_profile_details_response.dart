// To parse this JSON data, do
//
//     final mentorsDetailsResponse = mentorsDetailsResponseFromJson(jsonString);

import 'dart:convert';

MentorsDetailsResponse mentorsDetailsResponseFromJson(String str) =>
    MentorsDetailsResponse.fromJson(json.decode(str));

String mentorsDetailsResponseToJson(MentorsDetailsResponse data) =>
    json.encode(data.toJson());

class MentorsDetailsResponse {
  bool? result;
  String? message;
  Data? data;

  MentorsDetailsResponse({
    this.result,
    this.message,
    this.data,
  });

  factory MentorsDetailsResponse.fromJson(Map<String, dynamic> json) =>
      MentorsDetailsResponse(
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
  Instructor? instructor;

  Data({
    this.instructor,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        instructor: json["instructor"] == null
            ? null
            : Instructor.fromJson(json["instructor"]),
      );

  Map<String, dynamic> toJson() => {
        "instructor": instructor?.toJson(),
      };
}

class Instructor {
  int? id;
  String? image;
  String? name;
  double? rating;
  int? courseCount;
  int? studentsCount;
  About? about;
  List<Course>? courses;
  Reviews? reviews;

  Instructor({
    this.id,
    this.image,
    this.name,
    this.rating,
    this.courseCount,
    this.studentsCount,
    this.about,
    this.courses,
    this.reviews,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        id: json["id"],
        image: json["Image"],
        name: json["name"],
        rating: double.tryParse(json["rating"].toString()),
        courseCount: json["course_count"],
        studentsCount: json["students_count"],
        about: json["about"] == null ? null : About.fromJson(json["about"]),
        courses: json["courses"] == null
            ? []
            : List<Course>.from(
                json["courses"]!.map((x) => Course.fromJson(x))),
        reviews:
            json["reviews"] == null ? null : Reviews.fromJson(json["reviews"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Image": image,
        "name": name,
        "rating": rating,
        "course_count": courseCount,
        "students_count": studentsCount,
        "about": about?.toJson(),
        "courses": courses == null
            ? []
            : List<dynamic>.from(courses!.map((x) => x.toJson())),
        "reviews": reviews?.toJson(),
      };
}

class About {
  String? designation;
  List<Experience>? experiences;
  List<Education>? educations;

  About({
    this.designation,
    this.experiences,
    this.educations,
  });

  factory About.fromJson(Map<String, dynamic> json) => About(
        designation: json["designation"],
        experiences: json["experiences"] == null
            ? []
            : List<Experience>.from(
                json["experiences"]!.map((x) => Experience.fromJson(x))),
        educations: json["educations"] == null
            ? []
            : List<Education>.from(
                json["educations"]!.map((x) => Education.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "designation": designation,
        "experiences": experiences == null
            ? []
            : List<dynamic>.from(experiences!.map((x) => x.toJson())),
        "educations": educations == null
            ? []
            : List<dynamic>.from(educations!.map((x) => x.toJson())),
      };
}

class Education {
  String? name;
  String? degree;
  int? current;
  String? program;
  String? endDate;
  String? startDate;
  String? description;

  Education({
    this.name,
    this.degree,
    this.current,
    this.program,
    this.endDate,
    this.startDate,
    this.description,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        name: json["name"],
        degree: json["degree"],
        current: json["current"],
        program: json["program"],
        endDate: json["end_date"],
        startDate: json["start_date"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "degree": degree,
        "current": current,
        "program": program,
        "end_date": endDate,
        "start_date": startDate,
        "description": description,
      };
}

class Experience {
  String? name;
  String? title;
  int? current;
  dynamic endDate;
  String? location;
  String? startDate;
  String? description;
  String? employeeType;
  String? locationType;

  Experience({
    this.name,
    this.title,
    this.current,
    this.endDate,
    this.location,
    this.startDate,
    this.description,
    this.employeeType,
    this.locationType,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        name: json["name"],
        title: json["title"],
        current: json["current"],
        endDate: json["end_date"],
        location: json["location"],
        startDate: json["start_date"],
        description: json["description"],
        employeeType: json["employee_type"],
        locationType: json["location_type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "current": current,
        "end_date": endDate,
        "location": location,
        "start_date": startDate,
        "description": description,
        "employee_type": employeeType,
        "location_type": locationType,
      };
}

class Course {
  int? id;
  String? image;
  String? title;
  double? rating;
  int? totalReview;
  bool? isFavorite;

  Course({
    this.id,
    this.image,
    this.title,
    this.rating,
    this.totalReview,
    this.isFavorite,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        rating: double.tryParse(json["rating"].toString()),
        totalReview: json["total_review"],
        isFavorite: json["is_favorite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "rating": rating,
        "total_review": totalReview,
        "is_favorite": isFavorite,
      };
}

class Reviews {
  String? reviewCount;
  double? rating;

  Reviews({
    this.reviewCount,
    this.rating,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        reviewCount: json["review_count"],
        rating: double.tryParse(json["rating"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "review_count": reviewCount,
        "rating": rating,
      };
}
