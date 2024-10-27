import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:task/taskyApp/core/api/dio.dart';
import 'package:task/taskyApp/core/api/end_points.dart';
import 'package:task/taskyApp/core/errors/errors.dart';
import 'package:task/taskyApp/core/utiles/service_locator.dart';
import 'package:task/taskyApp/core/utiles/shared_prefrences.dart';
import 'package:task/taskyApp/features/userProfile/model/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  var dio = getIt.get<DioService>();
  Future<Either<Failure, UserModel>> getUserData() async {
    emit(UserLoading());
    String token = await ShPref.getAccessToken();
    Map<String, dynamic> headers = {
      'Authorization': 'Bearer $token',
    };
    final response = await dio.get(
      EndPoint.profile,
      headers: headers,
    );
    return response.fold((failure) {
      emit(UserFailed(errorMessage: failure.errorMessage));
      return left(failure);
    }, (userData) async {
      UserModel profileData = UserModel.fromJson(userData);
      log(profileData.displayName!);
      emit(UserSuccess(profileData: profileData));
      return right(profileData);
    });
  }
}
