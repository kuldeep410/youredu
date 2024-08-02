// To parse this JSON data, do
//
//     final baseSettingsResponse = baseSettingsResponseFromJson(jsonString);

import 'dart:convert';

BaseSettingsResponse baseSettingsResponseFromJson(String str) =>
    BaseSettingsResponse.fromJson(json.decode(str));

String baseSettingsResponseToJson(BaseSettingsResponse data) =>
    json.encode(data.toJson());

class BaseSettingsResponse {
  bool? result;
  String? message;
  Data? data;

  BaseSettingsResponse({
    this.result,
    this.message,
    this.data,
  });

  factory BaseSettingsResponse.fromJson(Map<String, dynamic> json) =>
      BaseSettingsResponse(
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
  String? applicationDetails;
  String? applicationName;
  String? author;
  String? emailAddress;
  String? officeAddress;
  String? paymentGateway;
  String? phoneNumber;

  Data({
    this.applicationDetails,
    this.applicationName,
    this.author,
    this.emailAddress,
    this.officeAddress,
    this.paymentGateway,
    this.phoneNumber,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        applicationDetails: json["application_details"],
        applicationName: json["application_name"],
        author: json["author"],
        emailAddress: json["email_address"],
        officeAddress: json["office_address"],
        paymentGateway: json["payment_gateway"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "application_details": applicationDetails,
        "application_name": applicationName,
        "author": author,
        "email_address": emailAddress,
        "office_address": officeAddress,
        "payment_gateway": paymentGateway,
        "phone_number": phoneNumber,
      };
}
