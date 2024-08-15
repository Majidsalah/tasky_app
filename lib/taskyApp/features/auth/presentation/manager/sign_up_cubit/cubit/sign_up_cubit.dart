import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task/taskyApp/core/utiles/service_locator.dart';
import 'package:task/taskyApp/features/auth/data/repo/auth_repo_impl.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  var auth = getIt.get<AuthRepoImpl>();

  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController displayName = TextEditingController();
  TextEditingController experienceYears = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController level = TextEditingController();


 getExperiencYears() {
    int parsedYears = int.parse(experienceYears.text);
    return parsedYears;
  }
  signUp() async {
    emit(SignUpLoadingState());
    final response = await auth.userSignUp(
      name: displayName.text,
      phone: "+2${phone.text}",
      password: password.text,
      level: 'junior',
      experienceYears: getExperiencYears(),
      address: address.text,
    );
    response.fold(
      (failure) => emit(SignUpFailed(failure.errorMessage)),
      (signUpModel) => emit(SignUpSuccessState()),
    );
  }
}
