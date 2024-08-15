import 'package:get_it/get_it.dart';
import 'package:task/taskyApp/core/api/dio.dart';
import 'package:task/taskyApp/features/auth/data/repo/auth_repo_impl.dart';

final GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<DioService>(DioService());
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<DioService>()));
}
