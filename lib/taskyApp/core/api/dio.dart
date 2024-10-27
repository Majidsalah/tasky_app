import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task/taskyApp/core/api/api_service.dart';
import 'package:task/taskyApp/core/errors/errors.dart';
import 'package:task/taskyApp/core/utiles/shared_prefrences.dart';
import 'package:task/taskyApp/features/home/data/models/refresh_token_model.dart';

class DioService extends ApiService {
  final dio = Dio();
  bool isRefreshing = false;
  String? newToken;

  DioService() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final accessToken = await ShPref.getAccessToken();
      options.headers["Authorization"] = "Bearer $accessToken";
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioException err, handler) async {
      log("Error: ${err.message}");
      log("Error Type: ${err.type}");
      log("Request Path: ${err.requestOptions.path}");
      log("Response Data: ${err.response?.data}");
      final requestPath = err.requestOptions.path;

      if (err.response?.statusCode == 401 && requestPath.contains("auth")) {
        return handler.next(DioException(
          requestOptions: err.requestOptions,
          error: Serverfailure.fromDioError(err),
        ));
      }

      if (err.response?.statusCode == 401 && !isRefreshing) {
        isRefreshing = true;
        bool tokenRefreshed = await refreshToken();
        isRefreshing = false;

        if (tokenRefreshed) {
          final opts = err.requestOptions;
          opts.headers["Authorization"] = "Bearer $newToken";

          return handler.resolve(await _retry(opts));
        } else {
          return handler.next(DioException(
            requestOptions: err.requestOptions,
            error: Serverfailure.fromDioError(err),
          ));
        }
      }

      return handler.next(DioException(
        requestOptions: err.requestOptions,
        error: Serverfailure.fromDioError(err),
      ));
    }));
  }
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> delete(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      bool isFromData = false}) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return right(response.data);
    } on DioException catch (e) {
      return left(Serverfailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, dynamic>> get(
    String path, {
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await dio.get(path,
          data: data,
          options: Options(headers: headers),
          queryParameters: queryParameters);
      return right(response.data);
    } on DioException catch (e) {
      return left(Serverfailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> post(String path,
      {Object? data,
      Map<String, dynamic>? headers,
      FormData? formData,
      bool isFromData = false}) async {
    try {
      final response = await dio.post(
        path,
        data: isFromData ? formData : data,
        options: Options(headers: headers),
      );
      return right(response.data);
    } on DioException catch (e) {
      return left(Serverfailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> put(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      bool isFromData = false}) async {
    try {
      final response = await dio.put(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return right(response.data);
    } on DioException catch (e) {
      return left(Serverfailure.fromDioError(e));
    }
  }

  Future<bool> refreshToken() async {
    final refreshToken = await ShPref.getrefreshToken();
    final queryParameters = {'token': refreshToken};

    final Response response = await dio.get(
        'https://todo.iraqsapp.com/auth/refresh-token?',
        queryParameters: queryParameters);
    if (response.statusCode == 201 || response.statusCode == 200) {
      final token = RefreshTokenModel.fromJason(response.data);
      log("New Token: ${token.token}");
      await ShPref.saveAccessToken(token.token);
      return true;
    } else {
      log("Failed to refresh token, status code: ${response.statusCode}");
      return false;
    }
  }
}
