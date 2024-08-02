import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lms/data/dio_service/api_service.dart';
import 'package:lms/data/model/profile_response/edit_profile_response.dart';
import 'package:lms/data/model/profile_response/update_password_response.dart';

import '../../response_structure/api_response.dart';

class EditProfileRepository {
  static Future<ApiResponse<EditProfileResponse>> editProfileData(data) async {
    try {
      EasyLoading.show(status: 'loading...');
      var response = await ApiService.getDio()!
          .post("/student/setting/update-profile", data: data);
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = editProfileResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      } else {
        var obj = editProfileResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        EasyLoading.dismiss();
        var obj = editProfileResponseFromJson(e.response.toString());

        return ApiResponse(
          httpCode: e.response!.statusCode,
          success: e.response!.data["result"],
          message: e.response!.data["message"],
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

  static Future<ApiResponse<UpdatePasswordResponse>> updatePassword(
      data) async {
    try {
      EasyLoading.show(status: 'loading...');
      var response = await ApiService.getDio()!
          .post("/student/setting/update-password", data: data);
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = updatePasswordResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      } else {
        var obj = updatePasswordResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        EasyLoading.dismiss();
        var obj = updatePasswordResponseFromJson(e.response.toString());

        return ApiResponse(
          httpCode: e.response!.statusCode,
          success: e.response!.data["result"],
          message: e.response!.data["message"],
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
