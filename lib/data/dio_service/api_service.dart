import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lms/utils/app_consts.dart';
import 'package:lms/utils/shared_preferences.dart';

class ApiService {
  static Dio? _dio;

  static Dio? getDio() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
          baseUrl: AppConst.baseUrlApi,
          headers: {Headers.contentTypeHeader: Headers.jsonContentType});

      _dio = Dio(options);

      _dio!.interceptors
          .add(InterceptorsWrapper(onRequest: (options, handler) async {
        if (kDebugMode) {
          print('Base Url : ${options.baseUrl}');
          print('End Point : ${options.path}');
          print('Method : ${options.method}');
          print('Data : ${options.data}');
          print('content type : ${options.contentType}');
        }

        var token = await SPUtill.getValue(SPUtill.keyAuthToken);
        options.headers['content-Type'] = 'application/json;charset=UTF-8';
        // print('content type 2 : ${options.contentType}');
        if (token != null) {
          if (kDebugMode) {
            print(("token :: $token"));
          }

          options.headers['Authorization'] = "${AppConst.bearerToken} $token";
          options.headers = {
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': "${AppConst.bearerToken} $token"
          };
        }
        return handler.next(options);
      }, onResponse: (response, handler) {
        if (kDebugMode) {
          print('response data : ${response.data}');
        }

        return handler.next(response);
      }, onError: (DioException e, handler) {
        if (kDebugMode) {
          print('Error Response : ${e.response}');
          print('Error message : ${e.message}');
          print('Error type : ${e.type.name}');
        }
        return handler.next(e);
      }));
    }
    return _dio;
  }
}
