import 'package:task/taskyApp/features/addTask/data/models/addtaskmodel.dart';

class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class AddTaskLoading extends AddTaskState {}

final class AddTaskFailed extends AddTaskState {
  final String errorMessage;

  AddTaskFailed({required this.errorMessage});
}

final class AddTaskSuccess extends AddTaskState {
  final AddTaskModel newTask;

  AddTaskSuccess({required this.newTask});
}
