import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lms/data/dio_service/api_service.dart';
import 'package:lms/data/model/bookmark_response/bookmark_response.dart';
import 'package:lms/data/model/course_details_response/course_details_response.dart';
import 'package:lms/data/model/course_enroll_response/course_enroll_response.dart';
import 'package:lms/data/response_structure/api_response.dart';

class CourseDetailsRepository {
  /// Course Details API -----------------
  static Future<ApiResponse<CourseDetailsResponse>>
      getCourseDetailsRepositoryApi(int? id) async {
    try {
      // EasyLoading.show(status: 'loading...');
      var response = await ApiService.getDio()!.get("/course/details/$id");
      // EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = courseDetailsResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      } else {
        var obj = courseDetailsResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        // EasyLoading.dismiss();
        var obj = courseDetailsResponseFromJson(e.response.toString());

        return ApiResponse(
          httpCode: e.response!.statusCode,
          success: e.response!.data["success"],
          message: e.response!.data["message"],
          error: obj,
        );
      } else {
        // EasyLoading.dismiss();
        if (kDebugMode) {
          print(e.message);
        }
        return ApiResponse(
            httpCode: -1, message: "Connection error ${e.message}");
      }
    }
  }

  /// Favorites Toggle API -----------------
  static Future<ApiResponse<BookmarkResponse>> bookmarkToggle(int? id) async {
    try {
      // EasyLoading.show(status: 'loading...');
      var response =
          await ApiService.getDio()!.get("/student/bookmark/update/$id");
      // EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = bookmarkResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      } else {
        var obj = bookmarkResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        // EasyLoading.dismiss();
        var obj = bookmarkResponseFromJson(e.response.toString());

        return ApiResponse(
          httpCode: e.response!.statusCode,
          success: e.response!.data["success"],
          message: e.response!.data["message"],
          error: obj,
        );
      } else {
        // EasyLoading.dismiss();
        if (kDebugMode) {
          print(e.message);
        }
        return ApiResponse(
            httpCode: -1, message: "Connection error ${e.message}");
      }
    }
  }

  /// Course Enroll API -----------------
  static Future<ApiResponse<CourseEnrollResponse>> getCourseEnrollApi(
      int? id) async {
    try {
      // EasyLoading.show(status: 'loading...');
      var response = await ApiService.getDio()!.get("/courses/$id/enroll/free");
      // EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = courseEnrollResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.success,
            message: obj.message,
            data: obj);
      } else {
        var obj = courseEnrollResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.success,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        // EasyLoading.dismiss();
        var obj = courseEnrollResponseFromJson(e.response.toString());

        return ApiResponse(
          httpCode: e.response!.statusCode,
          success: e.response!.data["success"],
          message: e.response!.data["message"],
          error: obj,
        );
      } else {
        // EasyLoading.dismiss();
        if (kDebugMode) {
          print(e.message);
        }
        return ApiResponse(
            httpCode: -1, message: "Connection error ${e.message}");
      }
    }
  }
}
