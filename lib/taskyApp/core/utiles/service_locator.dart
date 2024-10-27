import 'package:get_it/get_it.dart';
import 'package:task/taskyApp/core/api/dio.dart';
import 'package:task/taskyApp/features/addTask/data/repo/addTaskRepoImpl.dart';
import 'package:task/taskyApp/features/auth/data/repo/auth_repo_impl.dart';
import 'package:task/taskyApp/features/home/data/repo/allTasksRepo_impl.dart';

final GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<DioService>(DioService());
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<DioService>()));
  getIt.registerSingleton<AllTasksRepoImpl>(
      AllTasksRepoImpl(getIt.get<DioService>()));
  getIt.registerSingleton<Addtaskrepoimpl>(
      Addtaskrepoimpl(getIt.get<DioService>()));
}
