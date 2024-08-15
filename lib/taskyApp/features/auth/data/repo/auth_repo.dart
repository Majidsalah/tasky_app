import 'package:dartz/dartz.dart';
import 'package:task/taskyApp/core/errors/failure.dart';
import 'package:task/taskyApp/features/auth/data/models/signUpModel/sign_up.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignUpModel>> userSignUp({
    required String phone,
    required String password,
    required String name,
    required int experienceYears,
    required String level,
    required String address,
  });
}
