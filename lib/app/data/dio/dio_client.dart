import 'package:coin_one/app/data/dio/endpoints.dart';
import 'package:coin_one/constants.dart';
import 'package:dio/dio.dart';
// import 'package:get/get.dart' as G;

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  Future<dynamic> mainReqRes({
    required EndPoints endPoints,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    String? queryParameters,
  }) async {
    Response response;

    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }

    // if (endPoints.hasToken()) {
    //   String _token = G.Get.find<Model>().token;
    //   if (_token.isNotEmpty) {
    //     _dio.options.headers.addAll({"Authorization": "Bearer $_token"});
    //   }
    // }

    try {
      switch (endPoints.method()) {
        case HttpMethod.get:
          response = await _dio.get(
            queryParameters != null
                ? "$BaseUrl/${endPoints.path()}$queryParameters"
                : "$BaseUrl/${endPoints.path()}",
            queryParameters: data,
          );
          break;

        case HttpMethod.post:
          response =
              await _dio.post("$BaseUrl/${endPoints.path()}", data: data);
          break;

        case HttpMethod.put:
          response = await _dio.put("$BaseUrl/${endPoints.path()}", data: data);
          break;

        case HttpMethod.patch:
          response =
              await _dio.patch("$BaseUrl/${endPoints.path()}", data: data);
          break;

        case HttpMethod.delete:
          response =
              await _dio.delete("$BaseUrl/${endPoints.path()}", data: data);
          break;

        default:
          throw Exception("Invalid HTTP method");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response!;
      } else {
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
            throw Exception("Connection timeout");
          case DioExceptionType.sendTimeout:
            throw Exception("Send timeout");
          case DioExceptionType.receiveTimeout:
            throw Exception("Receive timeout");
          case DioExceptionType.badResponse:
            throw Exception("Response timeout");
          case DioExceptionType.cancel:
            throw Exception("Request was cancelled");
          case DioExceptionType.unknown:
            throw Exception("Unknown error");
          default:
            throw Exception("Unknown error");
        }
      }
    }
    return response;
  }
}

enum HttpMethod { get, post, put, patch, delete }
