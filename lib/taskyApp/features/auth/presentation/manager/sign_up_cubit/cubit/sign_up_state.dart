part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
final class SignUpSuccessState extends SignUpState {}

final class SignUpLoadingState extends SignUpState {}

final class SignUpFailed extends SignUpState {
  final String errorMessage;
  SignUpFailed(this.errorMessage);
}