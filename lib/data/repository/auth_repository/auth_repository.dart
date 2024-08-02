import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lms/data/body_response/auth_body/body_login.dart';
import 'package:lms/data/body_response/auth_body/body_verificaton.dart';
import 'package:lms/data/dio_service/api_service.dart';
import 'package:lms/data/model/auth_response/forget_password_model.dart';
import 'package:lms/data/model/auth_response/login_response.dart';
import 'package:lms/data/model/auth_response/response_sign_up.dart';
import 'package:lms/data/model/auth_response/response_verification_field.dart';

import '../../body_response/auth_body/body_phone_verification.dart';
import '../../model/auth_response/send_otp_model.dart';
import '../../response_structure/api_response.dart';

class AuthRepository {
  /// Login API -----------------
  static Future<ApiResponse<ResponseLogin>> getLogin(
      BodyLogin bodyLogin) async {
    try {
      EasyLoading.show(status: 'loading...');
      var response =
          await ApiService.getDio()!.post("/sign-in", data: bodyLogin);
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = responseLoginFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      } else {
        var obj = responseLoginFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        EasyLoading.dismiss();
        var obj = responseLoginFromJson(e.response.toString());

        return ApiResponse(
          httpCode: e.response?.statusCode,
          success: obj.result,
          message: obj.message,
          error: obj,
        );
      } else {
        EasyLoading.dismiss();
        if (kDebugMode) {
          print(e.message);
        }
        return ApiResponse(
            httpCode: -1, message: "Connection error ${e.message}");
      }
    }
  }

  ///SignUp Api////
  static Future<ApiResponse<ResponseSignUp>> getSignUp(data) async {
    try {
      EasyLoading.show(status: 'loading...');
      var response = await ApiService.getDio()!.post("/registration",
          data: data,
          options: Options(headers: {
            "Accept": "application/json",
          }));
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = responseSignUpFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      } else {
        var obj = responseSignUpFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        EasyLoading.dismiss();
        var obj = responseSignUpFromJson(e.response.toString());

        return ApiResponse(
          httpCode: e.response?.statusCode,
          success: obj.result,
          message: obj.message,
          error: obj,
        );
      } else {
        EasyLoading.dismiss();
        if (kDebugMode) {
          print(e.message);
        }
        return ApiResponse(
            httpCode: -1, message: "Connection error ${e.message}");
      }
    }
  }

  static Future<ApiResponse<ForgotPasswordModel>> forgetPasswordApi(
      data) async {
    try {
      EasyLoading.show(status: 'loading...');
      var response = await ApiService.getDio()!.post("/student/forgot-password",
          data: data,
          options: Options(headers: {
            "Accept": "application/json",
          }));
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = forgotPasswordModelFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      } else {
        var obj = forgotPasswordModelFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        EasyLoading.dismiss();
        var obj = forgotPasswordModelFromJson(e.response.toString());

        return ApiResponse(
          httpCode: e.response?.statusCode,
          success: obj.result,
          message: obj.message,
          error: obj,
        );
      } else {
        EasyLoading.dismiss();
        if (kDebugMode) {
          print(e.message);
        }
        return ApiResponse(
            httpCode: -1, message: "Connection error ${e.message}");
      }
    }
  }

  static Future<ApiResponse<ResponseVerificationField>> getValidation(
      BodyVerification bodyVerification) async {
    try {
      EasyLoading.show(status: 'loading...');
      var response = await ApiService.getDio()!
          .post("/student/verify-email", data: bodyVerification);
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = responseVerificationFieldFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      } else {
        var obj = responseVerificationFieldFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        EasyLoading.dismiss();
        var obj = responseVerificationFieldFromJson(e.response.toString());

        return ApiResponse(
          httpCode: e.response?.statusCode,
          success: obj.result,
          message: obj.message,
          error: obj,
        );
      } else {
        EasyLoading.dismiss();
        if (kDebugMode) {
          print(e.message);
        }
        return ApiResponse(
            httpCode: -1, message: "Connection error ${e.message}");
      }
    }
  }

  static Future<ApiResponse<ResponseVerificationField>> getPhoneValidation(
      data) async {
    try {
      EasyLoading.show(status: 'loading...');
      var response =
          await ApiService.getDio()!.post("/student/verify-phone", data: data);
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = responseVerificationFieldFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      } else {
        var obj = responseVerificationFieldFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        EasyLoading.dismiss();
        var obj = responseVerificationFieldFromJson(e.response.toString());

        return ApiResponse(
          httpCode: e.response?.statusCode,
          success: obj.result,
          message: obj.message,
          error: obj,
        );
      } else {
        EasyLoading.dismiss();
        if (kDebugMode) {
          print(e.message);
        }
        return ApiResponse(
            httpCode: -1, message: "Connection error ${e.message}");
      }
    }
  }

  ///send otp request to phone number
  static Future<ApiResponse<SendOtpModel>> sendOtpToPhone(data) async {
    try {
      EasyLoading.show(status: 'loading...');
      var response =
          await ApiService.getDio()!.post("/student/resend-otp-phone",
              data: data,
              options: Options(headers: {
                "Accept": "application/json",
              }));
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = sendOtpModelFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      } else {
        var obj = sendOtpModelFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        EasyLoading.dismiss();
        var obj = sendOtpModelFromJson(e.response.toString());

        return ApiResponse(
          httpCode: e.response?.statusCode,
          success: obj.result,
          message: obj.message,
          error: obj,
        );
      } else {
        EasyLoading.dismiss();
        if (kDebugMode) {
          print(e.message);
        }
        return ApiResponse(
            httpCode: -1, message: "Connection error ${e.message}");
      }
    }
  }
}
