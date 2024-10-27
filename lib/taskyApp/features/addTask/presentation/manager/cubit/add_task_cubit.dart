import 'package:bloc/bloc.dart';
import 'package:task/taskyApp/core/utiles/service_locator.dart';
import 'package:task/taskyApp/features/addTask/data/repo/addTaskRepoImpl.dart';
import 'package:task/taskyApp/features/addTask/presentation/manager/cubit/add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  var repo = getIt.get<Addtaskrepoimpl>();
  Future<void> createNewTask(
    String? image,
    String title,
    String desc,
    String priority,
  ) async {
    emit(AddTaskLoading());
    final response = await repo.addNewTask(
      image,
      title: title,
      desc: desc,
      priority: priority,
    );
    return response.fold(
        (failure) => emit(AddTaskFailed(errorMessage: failure.errorMessage)),
        (newTaskData) => emit(AddTaskSuccess(newTask: newTaskData)));
  }
}
