part of 'image_upload_cubit.dart';

class ImageUploadState {}

final class ImageUploadInitial extends ImageUploadState {}

final class ImageUploadLoading extends ImageUploadState {}

final class ImageUploadFailed extends ImageUploadState {
  final String errorMessage;

  ImageUploadFailed({required this.errorMessage});
}

final class ImageUploadSuccess extends ImageUploadState {
  String? image;

  ImageUploadSuccess({required this.image});
}
