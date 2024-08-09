import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ilia_movies/share/boundaries/http_connection/exception/http_error_exception.dart';
import 'package:ilia_movies/share/boundaries/http_connection/exception/internal_fail_exception.dart';
import 'package:ilia_movies/share/boundaries/http_connection/exception/not_found_exception.dart';
import 'package:ilia_movies/share/boundaries/http_connection/exception/unprocessable_Exception.dart';
import 'package:ilia_movies/share/boundaries/http_connection/http_facade.dart';
import 'package:ilia_movies/share/boundaries/http_connection/exception/exception_status/exception.dart';

import 'exception/authentication_fail_exception.dart';
import 'exception/bad_request_fail_exception.dart';

class HttpFacadeImpl implements HttpFacade {
  final Dio _dio;

  HttpFacadeImpl(
    this._dio,
    // this._hasConnectivity,
    // this._domain,
  );

  @override
  call(HttpMethod method, String endPoint,
      {Map<String, dynamic>? params, dynamic data}) async {
    // if (await _hasConnectivity()) {
    late String url;

    url = endPoint;

    final options = await _getOptions();
    return await _invoke(url, method,
        params: params, data: data, options: options);
    // }
  }

  // _getURL(String endPoint) async {
  //   final url = _domain(endPoint);

  //   return url;
  // }

  _invoke(String url, HttpMethod method,
      {Options? options, Map<String, dynamic>? params, dynamic data}) async {
    try {
      switch (method) {
        case HttpMethod.get:
          return await _get(url, param: params, options: options);
        case HttpMethod.post:
          return await _post(url, param: params, data: data, options: options);
        case HttpMethod.put:
          return await _put(url, param: params, data: data, options: options);
        case HttpMethod.delete:
          return await _delete(url,
              param: params, data: data, options: options);

        default:
          throw InvalidHttpMethodException(method.toString());
      }
    } on DioException catch (e) {
      var statusCode = e.response!.statusCode;
      var cause = e.response!.data;

      if (statusCode == 200) {
        throw SuccessRequest(cause);
      }
      if (statusCode == 400) {
        throw BadRequestFailException(cause);
      }
      if (statusCode == 401) {
        throw AuthenticationFailException(cause);
      }
      if (statusCode == 404) {
        throw NotFoundException(cause);
      }
      if (statusCode == 422) {
        throw UnprocessableException(cause);
      }
      if (statusCode == 500) {
        InternalFailException(cause);
      }
      var result = {'message': '[$statusCode] $cause'};
      if (cause is Map) {
        result = cause as Map<String, String>;
      }

      throw HttpErrorException(result);
    }
  }

  Future<dynamic> _post(String url,
      {Map<String, dynamic>? param, dynamic data, Options? options}) async {
    late Response response;

    response = await _dio.post(url,
        queryParameters: param, data: data, options: options);

    return response.data;
  }

  Future<dynamic> _put(String url,
      {Map<String, dynamic>? param, dynamic data, Options? options}) async {
    late Response response;

    response = await _dio.put(url,
        queryParameters: param, data: data, options: options);

    return response.data;
  }

  Future _get(
    String url, {
    Map<String, dynamic>? param,
    Options? options,
  }) async {
    late Response response;
    response = await _dio.get(url, queryParameters: param, options: options);
    return response.data;
  }

  Future<dynamic> _delete(String url,
      {Map<String, dynamic>? param, dynamic data, Options? options}) async {
    late Response response;

    response = await _dio.delete(url,
        queryParameters: param, data: data, options: options);

    return response.data;
  }

  Future<Options?> _getOptions() async {
    final headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      // HttpHeaders.acceptHeader: "text/plain"
    };
    return Options(headers: headers);
  }
}
