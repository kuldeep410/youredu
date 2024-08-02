import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lms/data/dio_service/api_service.dart';
import 'package:lms/data/model/see_all_response/see_all_response.dart';
import 'package:lms/data/response_structure/api_response.dart';

class SeeAllRepository {
  static Future<ApiResponse<SeeAllResponse>> getSeeAllRepositoryData(
      String? slugName) async {
    try {
      EasyLoading.show(status: 'loading...');
      var response =
          await ApiService.getDio()!.get("/see-all-courses?type=$slugName");
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = seeAllResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      } else {
        var obj = seeAllResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.result,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        EasyLoading.dismiss();
        var obj = seeAllResponseFromJson(e.response.toString());

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
