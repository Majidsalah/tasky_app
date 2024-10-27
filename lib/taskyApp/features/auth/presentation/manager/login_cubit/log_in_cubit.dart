import 'package:bloc/bloc.dart';
import 'package:task/taskyApp/core/utiles/service_locator.dart';
import 'package:task/taskyApp/features/auth/data/repo/auth_repo_impl.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());
  var auth = getIt.get<AuthRepoImpl>();

  Future<void> logIn(
    String phone,
    String password,
  ) async {
    emit(LogInLoadingState());
    final response = await auth.userLogIn(
      phone: "+2$phone",
      password: password,
    );

    response.fold(
      (failure) => emit(LogInFailed(failure.errorMessage)),
      (logInModel) => emit(LogInSuccessState()),
    );
  }
}
