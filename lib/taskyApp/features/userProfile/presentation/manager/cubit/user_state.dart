part of 'user_cubit.dart';

class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final UserModel profileData;

  UserSuccess({required this.profileData});
}

final class UserFailed extends UserState {
  final String errorMessage;

  UserFailed({required this.errorMessage});
}
