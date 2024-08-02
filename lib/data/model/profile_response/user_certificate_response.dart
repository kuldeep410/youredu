import 'dart:convert';

UserCertificateResponse userCertificateResponseFromJson(String str) =>
    UserCertificateResponse.fromJson(json.decode(str));

String userCertificateResponseToJson(UserCertificateResponse data) =>
    json.encode(data.toJson());

class UserCertificateResponse {
  UserCertificateResponse({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  bool? success;
  String? status;
  String? message;
  Data? data;

  factory UserCertificateResponse.fromJson(Map<String, dynamic> json) =>
      UserCertificateResponse(
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
    this.lastPage,
    this.currentPage,
    this.certificates,
  });

  int? lastPage;
  int? currentPage;
  List<CertificateElement>? certificates;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        lastPage: json["last_page"],
        currentPage: json["current_page"],
        certificates: List<CertificateElement>.from(
            json["certificates"].map((x) => CertificateElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "last_page": lastPage,
        "current_page": currentPage,
        "certificates": List<dynamic>.from(certificates!.map((x) => x.toJson())),
      };
}

class CertificateElement {
  CertificateElement({
    this.id,
    this.title,
    this.certificate,
  });

  int? id;
  String? title;
  CertificateCertificate? certificate;

  factory CertificateElement.fromJson(Map<String, dynamic> json) =>
      CertificateElement(
        id: json["id"],
        title: json["title"],
        certificate: CertificateCertificate.fromJson(json["certificate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "certificate": certificate?.toJson(),
      };
}

class CertificateCertificate {
  CertificateCertificate({
    this.id,
    this.userGrade,
    this.file,
    this.createdAt,
  });

  int? id;
  int? userGrade;
  String? file;
  int? createdAt;

  factory CertificateCertificate.fromJson(Map<String, dynamic> json) =>
      CertificateCertificate(
        id: json["id"],
        userGrade: json["user_grade"],
        file: json["file"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_grade": userGrade,
        "file": file,
        "created_at": createdAt,
      };
}
