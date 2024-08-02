import 'dart:convert';

BodyVerification bodyVerificationFromJson(String str) =>
    BodyVerification.fromJson(json.decode(str));

String bodyVerificationToJson(BodyVerification data) =>
    json.encode(data.toJson());

class BodyVerification {
  BodyVerification({
    this.email,
    this.code,
  });

  String? email;
  int? code;

  factory BodyVerification.fromJson(Map<String, dynamic> json) =>
      BodyVerification(
        email: json["email"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "code": code,
      };
}
