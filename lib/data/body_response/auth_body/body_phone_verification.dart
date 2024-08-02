import 'dart:convert';

BodyPhoneVerification bodyPhoneVerificationFromJson(String str) =>
    BodyPhoneVerification.fromJson(json.decode(str));

String bodyPhoneVerificationToJson(BodyPhoneVerification data) =>
    json.encode(data.toJson());

class BodyPhoneVerification {
  BodyPhoneVerification({
    this.phone,
    this.code,
  });

  String? phone;
  int? code;

  factory BodyPhoneVerification.fromJson(Map<String, dynamic> json) =>
      BodyPhoneVerification(
        phone: json["phone"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "code": code,
      };
}
