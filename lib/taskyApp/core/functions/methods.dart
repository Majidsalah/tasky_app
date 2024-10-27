String formatDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);

  String formattedDate = "${dateTime.day.toString().padLeft(2, '0')}/"
      "${dateTime.month.toString().padLeft(2, '0')}/"
      "${dateTime.year}";

  return formattedDate;
}
// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:saifni_app/core/utils/app_strings.dart';
// import 'package:saifni_app/features/auth/login/data/models/authenticate.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:saifni_app/app.dart';
// import 'package:saifni_app/config/routes/app_routes.dart';
// import 'package:saifni_app/core/api/end_points.dart';
// import 'package:saifni_app/core/api/server_error_model.dart';
// import 'package:saifni_app/core/api/status_code.dart';
// import 'package:saifni_app/core/utils/helpers.dart';
// import 'package:saifni_app/globals.dart' as globals;

// class AppIntercepters extends Interceptor {
//   final Dio client;
//   final SharedPreferences sharedPreferences;

//   const AppIntercepters(this.client, this.sharedPreferences);

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
//     options.headers[AppStrings.contentType] = AppStrings.applicationJson;
//     options.headers[AppStrings.acceptLanguage] = globals.lang;
//     options.headers[AppStrings.xApiKey] = globals.xApiKey;
//     if (globals.accessToken != null) {
//       options.headers[AppStrings.authorization] =
//           "${AppStrings.bearer} ${globals.accessToken}";
//     }
//     super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) async {
//     debugPrint(
//         'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
//     super.onResponse(response, handler);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     ServerErrorModel? serverErrorModel;

//     if (err.response?.data != null) {
//       var jsonData = jsonDecode(err.response?.data ?? {});
//       serverErrorModel = ServerErrorModel.fromJson(jsonData);
//     }

//     debugPrint(
//         'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
//     Helpers.printOnlyInDebug(
//         "_refreshToken => onError ${err.response?.statusCode} ${err.response?.data} ${serverErrorModel?.errorCode} ${serverErrorModel?.message}");

//     if (serverErrorModel?.message.contains("Invalid refresh token.") ?? false) {
//       await _forceLogout();
//       return handler.next(err);
//     }
//     if (err.response?.statusCode == StatusCode.unauthorized) {
//       AuthenticateModel? authenticate = await _refreshToken();
//       if (authenticate != null) {
//         return handler.resolve(await _retry(
//           requestOptions: err.response!.requestOptions,
//           newToken: authenticate.accessToken,
//         ));
//       } else {
//         await _forceLogout();
//       }
//     }
//     return handler.next(err);
//   }

//   Future<bool> _saveToken(AuthenticateModel authenticate) {
//     globals.accessToken = authenticate.accessToken;
//     globals.refreshToken = authenticate.refreshToken;
//     String token = jsonEncode(authenticate.toJson());
//     return sharedPreferences.setString(AppStrings.authenticate, token);
//   }

//   Future<Response<dynamic>> _retry({
//     required RequestOptions requestOptions,
//     required String newToken,
//   }) async {
//     final options = Options(
//       method: requestOptions.method,
//       headers: {
//         ...requestOptions.headers,
//         AppStrings.authorization: "${AppStrings.bearer} $newToken",
//       },
//     );
//     final response = await client.request<dynamic>(
//       requestOptions.path,
//       data: requestOptions.data,
//       queryParameters: requestOptions.queryParameters,
//       options: options,
//     );
//     return response;
//   }

//   Future<AuthenticateModel?> _refreshToken() async {
//     if (globals.accessToken == null || globals.refreshToken == null) {
//       return null;
//     }
//     final response = await client.post(EndPoints.authRefresh, data: {
//       AppStrings.accessToken: globals.accessToken,
//       AppStrings.refreshToken: globals.refreshToken,
//     });
//     Helpers.printOnlyInDebug("_refreshToken => response $response");
//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.data);
//       final authenticate = AuthenticateModel.fromJson(jsonData);
//       final bool isSaved = await _saveToken(authenticate);
//       if (isSaved) {
//         return authenticate;
//       }
//       return null;
//     } else {
//       return null;
//     }
//   }

//   Future<void> _forceLogout() async {
//     await sharedPreferences.remove(AppStrings.user);
//     await sharedPreferences.remove(AppStrings.authenticate);
//     globals.accessToken = null;
//     globals.refreshToken = null;
//     navigatorKey.currentState?.pushReplacementNamed(Routes.loginRoute);
//     Helpers.showToast(
//       "Your session expired you need to login again",
//       type: SnackBarType.error,
//     );
//   }
// }
