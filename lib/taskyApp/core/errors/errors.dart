import 'dart:developer';
import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class Serverfailure extends Failure {
  Serverfailure(super.errorMessage);

  factory Serverfailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return Serverfailure("Request to API was cancelled");
      case DioExceptionType.connectionTimeout:
        return Serverfailure("Connection timed out");
      case DioExceptionType.receiveTimeout:
        return Serverfailure("Receive timeout in connection with API server");
      case DioExceptionType.sendTimeout:
        return Serverfailure("Send timeout in connection with API server");
      case DioExceptionType.badCertificate:
        return Serverfailure("Bad certificate error");
      case DioExceptionType.badResponse:
        return Serverfailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response?.data,
        );
      case DioExceptionType.connectionError:
        return Serverfailure("Connection error occurred");

      case DioExceptionType.unknown:
        return Serverfailure("An unexpected error occurred. Please try again.");

      default:
        return Serverfailure("Unexpected error occurred. Please try again.");
    }
  }

  factory Serverfailure.fromResponse(int statusCode, dynamic response) {
    String message = 'An unknown error occurred';

    if (response is Map<String, dynamic>) {
      if (response.containsKey('message')) {
        message = response['message'];
      } else if (response.containsKey('error')) {
        message = response['error'];
      } else {
        message = 'An error occurred, but no message was provided.';
      }
      log('Response message extracted: $message');
    } else {
      log('Unexpected response format: ${response.runtimeType}');
    }

    switch (statusCode) {
      case 401:
        return Serverfailure(message);
      case 403:
        return Serverfailure(
            "You don't have permission to access this resource.");
      case 404:
        return Serverfailure("The requested resource was not found.");
      case 422:
        return Serverfailure("Validation error occurred.");
      case 500:
        return Serverfailure("Internal server error occurred.");
      default:
        return Serverfailure("Unexpected error occurred. $message");
    }
  }
}
