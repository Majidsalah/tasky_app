import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:task/taskyApp/core/api/dio.dart';
import 'package:task/taskyApp/core/api/end_points.dart';
import 'package:task/taskyApp/core/errors/errors.dart';
import 'package:task/taskyApp/core/utiles/shared_prefrences.dart';
import 'package:task/taskyApp/features/home/data/models/all_tasks.dart';
import 'package:task/taskyApp/features/home/data/repo/allTasks_repo.dart';

class AllTasksRepoImpl extends AlltasksRepo {
  final DioService dio;

  AllTasksRepoImpl(this.dio);
  @override
  Future<Either<Failure, List<TasksModel>>> getAllTasks(
      String? selectedStatus) async {
    String token = await ShPref.getAccessToken();
    Map<String, dynamic> headers = {
      'Authorization': 'Bearer $token',
    };

    final response = await dio
        .get("${EndPoint.baseUrl}${EndPoint.allTasksList}", headers: headers);

    return response.fold(
      (failure) {
        log(failure.errorMessage);
        return left(failure);
      },
      (tasks) {
        final List<TasksModel> allTasks = [];
        List<TasksModel> filteredList = [];
        for (var task in tasks) {
          TasksModel getTask = TasksModel(
              id: task['_id'] as String?,
              image: task['image'] as String?,
              title: task['title'] as String?,
              desc: task['desc'] as String?,
              priority: task['priority'] as String?,
              status: task['status'] as String?,
              user: task['user'] as String?,
              createdAt: task['createdAt'] as String?);
          allTasks.add(getTask);
        }
        if (selectedStatus == 'all') {
          filteredList.addAll(allTasks);
        } else {
          filteredList.addAll(
              allTasks.where((task) => task.status == selectedStatus).toList());
        }
        return right(filteredList);
      },
    );
  }
}
