import 'package:dio/dio.dart';
import 'package:task/taskyApp/core/api/api_service.dart';
import 'package:task/taskyApp/core/errors/failure.dart';

class DioService extends ApiService {
  final dio = Dio();

  @override
  Future delete(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFromData = false}) {
    throw UnimplementedError();
  }

  @override
  Future get(String path, {Object? data, Map<String, dynamic>? headers}) async {
    try {
      var response = await dio.get(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      return Serverfailure.fromDioError(e);
    }
  }

  @override
  Future post(String path,
      {Object? data,
      Map<String, dynamic>? headers,
      bool isFromData = false}) async {
    try {
      var response = await dio.post(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      return Serverfailure.fromDioError(e);
    }
  }

  @override
  Future put(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFromData = false}) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
