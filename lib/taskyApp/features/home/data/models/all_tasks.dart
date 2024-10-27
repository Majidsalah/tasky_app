class TasksModel {
  String? id;
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? status;
  String? user;
  String? createdAt;
  String? updatedAt;

  TasksModel({
    this.id,
    this.image,
    this.title,
    this.desc,
    this.priority,
    this.status,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  factory TasksModel.fromJson(Map<String, dynamic> json) => TasksModel(
        id: json['_id'] as String?,
        image: json['image'] as String?,
        title: json['title'] as String?,
        desc: json['desc'] as String?,
        priority: json['priority'] as String?,
        status: json['status'] as String?,
        user: json['user'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'image': image,
        'title': title,
        'desc': desc,
        'priority': priority,
        'status': status,
        'user': user,
      };
}
