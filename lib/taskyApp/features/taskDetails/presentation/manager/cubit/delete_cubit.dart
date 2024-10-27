import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:task/taskyApp/core/api/dio.dart';
import 'package:task/taskyApp/core/api/end_points.dart';
import 'package:task/taskyApp/core/errors/errors.dart';
import 'package:task/taskyApp/core/utiles/service_locator.dart';
import 'package:task/taskyApp/core/utiles/shared_prefrences.dart';
import 'package:task/taskyApp/features/home/data/models/all_tasks.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit() : super(DeleteInitial());
  var dio = getIt.get<DioService>();
  Future<Either<Failure, TasksModel>> deleteTask(String taskId) async {
    emit(DeleteTaskLoading());
    String token = await ShPref.getAccessToken();
    Map<String, dynamic> headers = {
      'Authorization': 'Bearer $token',
    };
    final response = await dio.delete(
      EndPoint.editTask + taskId,
      headers: headers,
    );
    return response.fold((failure) {
      emit(DeleteTaskFailure());
      return left(failure);
    }, (deletedTaskData) async {
      TasksModel deletedTask = TasksModel.fromJson(deletedTaskData);
      log(deletedTask.id!);
      emit(DeleteTaskSuccess());
      return right(deletedTask);
    });
  }
}
