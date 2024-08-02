import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lms/data/dio_service/api_service.dart';
import 'package:lms/data/model/category_response/featured_category_response.dart';
import 'package:lms/data/response_structure/api_response.dart';

class FeaturedCategoryRepository {
  /// Category Details -----------------
  static Future<ApiResponse<FeaturedCategoryResponse>>
      getSellAllCategoryApi() async {
    try {
      EasyLoading.show(status: 'loading...');
      var response = await ApiService.getDio()!.get("/course/categories");
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = featuredCategoryResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      } else {
        var obj = featuredCategoryResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        EasyLoading.dismiss();
        var obj = featuredCategoryResponseFromJson(e.response.toString());

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
