import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task/taskyApp/core/api/dio.dart';
import 'package:task/taskyApp/core/api/end_points.dart';
import 'package:task/taskyApp/core/errors/errors.dart';
import 'package:task/taskyApp/core/utiles/shared_prefrences.dart';
import 'package:task/taskyApp/features/addTask/data/models/addtaskmodel.dart';
import 'package:task/taskyApp/features/addTask/data/models/image_path_model.dart';
import 'package:task/taskyApp/features/addTask/data/repo/addTaskRepo.dart';

class Addtaskrepoimpl extends Addtaskrepo {
  final DioService dio;

  Addtaskrepoimpl(this.dio);
  @override
  Future<Either<Failure, ImagePathModel>> uploadImageToServer(
      String path) async {
    String token = await ShPref.getAccessToken();
    Map<String, dynamic> headers = {
      'Authorization': 'Bearer $token',
      "Content-Type": "multipart/form-data",
    };
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(path,
          contentType: DioMediaType('image', 'jpeg')),
    });
    final response = await dio.post('https://todo.iraqsapp.com/upload/image',
        headers: headers, formData: formData, isFromData: true);
    return response.fold((failure) => left(failure), (imagePathModel) async {
      ImagePathModel image = ImagePathModel.fromJson(imagePathModel);
      await ShPref.saveImage(image.image!);

      return right(image);
    });
  }

  @override
  Future<Either<Failure, AddTaskModel>> addNewTask(String? image,
      {required String title,
      required String desc,
      required String priority}) async {
    String token = await ShPref.getAccessToken();
    Map<String, dynamic> headers = {
      'Authorization': 'Bearer $token',
    };
    final response = await dio.post(EndPoint.addTask, headers: headers, data: {
      ApiKeys.image: image,
      ApiKeys.title: title,
      ApiKeys.description: desc,
      ApiKeys.priority: priority,
    });
    return response.fold((failure) => left(failure), (newTaskData) async {
      AddTaskModel addTaskModel = AddTaskModel.fromJson(newTaskData);
      log(addTaskModel.title!);
      return right(addTaskModel);
    });
  }
}
