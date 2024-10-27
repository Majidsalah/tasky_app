import 'package:bloc/bloc.dart';
import 'package:task/taskyApp/core/utiles/service_locator.dart';
import 'package:task/taskyApp/features/addTask/data/repo/addTaskRepoImpl.dart';

part 'image_upload_state.dart';

class ImageUploadCubit extends Cubit<ImageUploadState> {
  ImageUploadCubit() : super(ImageUploadInitial());
  var repo = getIt.get<Addtaskrepoimpl>();

  Future<void> uploadImage(String path) async {
    emit(ImageUploadLoading());
    final response = await repo.uploadImageToServer(path);
    response.fold(
      (failure) => emit(ImageUploadFailed(errorMessage: failure.errorMessage)),
      (image) => emit(ImageUploadSuccess(image: image.image)),
    );
  }

  resetState() {
    emit(ImageUploadInitial());
  }
}
