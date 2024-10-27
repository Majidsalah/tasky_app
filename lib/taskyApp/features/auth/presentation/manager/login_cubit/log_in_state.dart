part of 'log_in_cubit.dart';

class LogInState {}

final class LogInInitial extends LogInState {}

final class LogInSuccessState extends LogInState {}

final class LogInLoadingState extends LogInState {}

final class LogInFailed extends LogInState {
  final String errorMessage;
  LogInFailed(this.errorMessage);
}
