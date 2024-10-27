import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/taskyApp/core/utiles/service_locator.dart';
import 'package:task/taskyApp/features/home/data/models/all_tasks.dart';
import 'package:task/taskyApp/features/home/data/repo/allTasksRepo_impl.dart';

part 'home_tasks_state.dart';

class HomeTasksCubit extends Cubit<HomeTasksState> {
  HomeTasksCubit() : super(HomeTasksInitial());

  var repo = getIt.get<AllTasksRepoImpl>();

  Future<void> getTasksList(String? selectedStatus) async {
    emit(HomeTasksLoading());
    final response = await repo.getAllTasks(selectedStatus);
    response.fold(
      (failure) async {
        if (failure.errorMessage == 'Unauthorized') {
          emit(HomeTasksRefresh());
        } else {
          emit(HomeTasksFailed(errorMessage: failure.errorMessage));
        }
      },
      (allTasks) => {emit(HomeTasksSuccess(homeTasksList: allTasks))},
    );
  }

  resetState() {
    emit(HomeTasksInitial());
  }
}
