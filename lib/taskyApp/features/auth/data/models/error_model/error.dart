class Errordddd {
  String? message;
  String? error;
  int? statusCode;

  Errordddd({this.message, this.error, this.statusCode});

  factory Errordddd.fromJson(Map<String, dynamic> json) => Errordddd(
        message: json['message'] as String?,
        error: json['error'] as String?,
        statusCode: json['statusCode'] as int?,
      );
}
