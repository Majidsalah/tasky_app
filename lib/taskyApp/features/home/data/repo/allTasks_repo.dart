import 'package:dartz/dartz.dart';
import 'package:task/taskyApp/core/errors/errors.dart';
import 'package:task/taskyApp/features/home/data/models/all_tasks.dart';

abstract class AlltasksRepo {
  Future<Either<Failure, List<TasksModel>>> getAllTasks(String? selectedStatus);
  // Future<Either<Failure, RefreshTokenModel>> refreshToken();
}
