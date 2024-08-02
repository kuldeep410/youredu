// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) =>
    ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) =>
    json.encode(data.toJson());

class ProfileResponse {
  bool? result;
  String? message;
  Data? data;

  ProfileResponse({
    this.result,
    this.message,
    this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
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
  String? title;
  Student? student;
  Enrolls? enrolls;
  List<dynamic>? certificates;
  List<Assignment>? assignment;

  Data({
    this.title,
    this.student,
    this.enrolls,
    this.certificates,
    this.assignment,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        student:
            json["student"] == null ? null : Student.fromJson(json["student"]),
        enrolls:
            json["enrolls"] == null ? null : Enrolls.fromJson(json["enrolls"]),
        certificates: json["certificates"] == null
            ? []
            : List<dynamic>.from(json["certificates"]!.map((x) => x)),
        assignment: json["assignment"] == null
            ? []
            : List<Assignment>.from(
                json["assignment"]!.map((x) => Assignment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "student": student?.toJson(),
        "enrolls": enrolls?.toJson(),
        "certificates": certificates == null
            ? []
            : List<dynamic>.from(certificates!.map((x) => x)),
        "assignment": assignment == null
            ? []
            : List<dynamic>.from(assignment!.map((x) => x.toJson())),
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

class Enrolls {
  List<Course> courses;
  Pagination? pagination;

  Enrolls({
    this.courses = const [],
    this.pagination,
  });

  factory Enrolls.fromJson(Map<String, dynamic> json) => Enrolls(
        courses: json["courses"] == null
            ? []
            : List<Course>.from(
                json["courses"]!.map((x) => Course.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        // ignore: unnecessary_null_comparison
        "courses": courses == null
            ? []
            : List<dynamic>.from(courses.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class Course {
  int? id;
  String? title;
  int? price;
  int? discountPrice;
  String? image;
  double? rate;
  int? totalSales;
  int? reviewCount;
  int? isFree;
  int? isDiscount;
  DateTime? createdAt;
  String? courseCreator;
  String? details;
  bool? isBookmark;
  bool? isPurchased;

  Course({
    this.id,
    this.title,
    this.price,
    this.discountPrice,
    this.image,
    this.rate,
    this.totalSales,
    this.reviewCount,
    this.isFree,
    this.isDiscount,
    this.createdAt,
    this.courseCreator,
    this.details,
    this.isBookmark,
    this.isPurchased,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        discountPrice: json["discount_price"],
        image: json["image"],
        rate: double.tryParse(json["rate"].toString()),
        totalSales: json["total_sales"],
        reviewCount: json["reviewCount"],
        isFree: json["is_free"],
        isDiscount: json["is_discount"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        courseCreator: json["course_creator"],
        details: json["details"],
        isBookmark: json["is_bookmark"],
        isPurchased: json["is_purchased"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "discount_price": discountPrice,
        "image": image,
        "rate": rate,
        "total_sales": totalSales,
        "reviewCount": reviewCount,
        "is_free": isFree,
        "is_discount": isDiscount,
        "created_at": createdAt?.toIso8601String(),
        "course_creator": courseCreator,
        "details": details,
        "is_bookmark": isBookmark,
        "is_purchased": isPurchased,
      };
}

class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "count": count,
        "per_page": perPage,
        "current_page": currentPage,
        "total_pages": totalPages,
      };
}

class Student {
  int? userId;
  String? name;
  String? email;
  String? mobile;
  String? avatar;
  int? statusId;
  String? status;
  DateTime? dateOfBirth;
  String? joinDate;

  Student({
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

  factory Student.fromJson(Map<String, dynamic> json) => Student(
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
