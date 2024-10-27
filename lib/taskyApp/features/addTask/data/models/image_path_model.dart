class ImagePathModel {
  String? image;
  ImagePathModel({required this.image});

  factory ImagePathModel.fromJson(Map<String, dynamic> jason) =>
      ImagePathModel(image: jason['image']);
}
