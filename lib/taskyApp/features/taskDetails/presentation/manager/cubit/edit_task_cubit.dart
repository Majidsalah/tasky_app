import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:task/taskyApp/core/api/dio.dart';
import 'package:task/taskyApp/core/api/end_points.dart';
import 'package:task/taskyApp/core/errors/errors.dart';
import 'package:task/taskyApp/core/utiles/service_locator.dart';
import 'package:task/taskyApp/core/utiles/shared_prefrences.dart';
import 'package:task/taskyApp/features/home/data/models/all_tasks.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit() : super(EditTaskInitial());

  var dio = getIt.get<DioService>();
  Future<Either<Failure, TasksModel>> editTask(String title, String desc,
      String priority, String status, String taskId) async {
    emit(EditTaskLoading());
    String token = await ShPref.getAccessToken();
    Map<String, dynamic> headers = {
      'Authorization': 'Bearer $token',
    };
    final response =
        await dio.put(EndPoint.editTask + taskId, headers: headers, data: {
      ApiKeys.title: title,
      ApiKeys.description: desc,
      ApiKeys.priority: priority,
      ApiKeys.status: status,
    });
    return response.fold((failure) {
      emit(EditTaskFailure());
      return left(failure);
    }, (editedTaskData) async {
      TasksModel editedTask = TasksModel.fromJson(editedTaskData);
      emit(EditTaskSuccess());
      return right(editedTask);
    });
  }
}
