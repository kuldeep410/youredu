import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lms/data/dio_service/api_service.dart';
import 'package:lms/data/model/slider_response/slider_details_response.dart';
import 'package:lms/data/model/slider_response/slider_response.dart';
import 'package:lms/data/response_structure/api_response.dart';

class SliderRepository {
  static Future<ApiResponse<SliderResponse>> getSliderListApi() async {
    try {
      EasyLoading.show(status: 'loading...');
      var response = await ApiService.getDio()!.get("/slider");
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = sliderResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.success,
            message: obj.message,
            data: obj);
      } else {
        var obj = sliderResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.success,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        EasyLoading.dismiss();
        var obj = sliderResponseFromJson(e.response.toString());

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

  static Future<ApiResponse<SliderDetailsResponse>> getSliderDetailsApi(
      int? sliderId) async {
    try {
      EasyLoading.show(status: 'loading...');
      var response = await ApiService.getDio()!.get("/slider/$sliderId");
      EasyLoading.dismiss();
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        var obj = sliderDetailsResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.success,
            message: obj.message,
            data: obj);
      } else {
        var obj = sliderDetailsResponseFromJson(response.toString());
        return ApiResponse(
            httpCode: response.statusCode,
            success: obj.success,
            message: obj.message,
            data: obj);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown) {
        EasyLoading.dismiss();
        var obj = sliderDetailsResponseFromJson(e.response.toString());

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
