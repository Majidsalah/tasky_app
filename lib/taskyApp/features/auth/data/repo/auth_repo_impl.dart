import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task/taskyApp/core/api/dio.dart';
import 'package:task/taskyApp/core/api/end_points.dart';
import 'package:task/taskyApp/core/errors/failure.dart';
import 'package:task/taskyApp/features/auth/data/models/signUpModel/sign_up.dart';
import 'package:task/taskyApp/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final DioService dio;
  AuthRepoImpl(this.dio);
  @override
  Future<Either<Failure, SignUpModel>> userSignUp(
      {required String phone,
      required String password,
      required String name,
      required int experienceYears,
      required String level,
      required String address}) async {
    try {
      var response = await dio.post(
        '${EndPoint.baseUrl}${EndPoint.register}',
        data: {
          ApiKeys.phone: phone,
          ApiKeys.password: password,
          ApiKeys.displayName: name,
          ApiKeys.experienceYears: experienceYears,
          ApiKeys.address: address,
          ApiKeys.level: level
        },
      );
      final signUPModel = SignUpModel.fromJason(response);
      print(signUPModel.accessToken);
      return right(signUPModel);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailure.fromDioError(e));
      }

      return left(Serverfailure(e.toString()));
    }
  }
}
