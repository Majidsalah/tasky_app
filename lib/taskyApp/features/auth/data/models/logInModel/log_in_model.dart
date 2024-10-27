class LogInModel {
  final String id;
  final String accessToken;
  final String refreshToken;

  LogInModel(
      {required this.id,
      required this.accessToken,
      required this.refreshToken});

  factory LogInModel.fromJason(Map<String, dynamic> data) => LogInModel(
        id: data['_id'],
        accessToken: data['access_token'],
        refreshToken: data['refresh_token'],
      );
}
