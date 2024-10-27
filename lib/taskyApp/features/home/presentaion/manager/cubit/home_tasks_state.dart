part of 'home_tasks_cubit.dart';

@immutable
class HomeTasksState {}

final class HomeTasksInitial extends HomeTasksState {}

final class HomeTasksLoading extends HomeTasksState {}

final class HomeTasksRefresh extends HomeTasksState {}

final class HomeTasksSuccess extends HomeTasksState {
  final List<TasksModel> homeTasksList;

  HomeTasksSuccess({required this.homeTasksList});
}

final class HomeTasksFailed extends HomeTasksState {
  final String errorMessage;

  HomeTasksFailed({required this.errorMessage});
}
