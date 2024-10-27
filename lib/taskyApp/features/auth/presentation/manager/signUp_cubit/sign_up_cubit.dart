import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task/taskyApp/core/utiles/service_locator.dart';
import 'package:task/taskyApp/features/auth/data/repo/auth_repo_impl.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  var auth = getIt.get<AuthRepoImpl>();

  Future<void> signUp(
    String phone,
    String password,
    String name,
    int experienceYears,
    String address,
    String level,
  ) async {
    emit(SignUpLoadingState());
    final response = await auth.userSignUp(
      phone: "+2$phone",
      password: password,
      name: name,
      experienceYears: experienceYears,
      address: address,
      level: level,
    );

    response.fold(
      (failure) => emit(SignUpFailed(failure.errorMessage)),
      (signUpModel) => emit(SignUpSuccessState()),
    );
  }
}
