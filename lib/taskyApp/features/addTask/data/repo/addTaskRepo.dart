import 'package:dartz/dartz.dart';
import 'package:task/taskyApp/core/errors/errors.dart';
import 'package:task/taskyApp/features/addTask/data/models/addtaskmodel.dart';
import 'package:task/taskyApp/features/addTask/data/models/image_path_model.dart';

abstract class Addtaskrepo {
  Future<Either<Failure, ImagePathModel>> uploadImageToServer(String path);
  Future<Either<Failure, AddTaskModel>> addNewTask(
    String? image, {
    required String title,
    required String desc,
    required String priority,
  });
}
