class RefreshTokenModel {
  final String token;

  RefreshTokenModel({
    required this.token,
  });

  factory RefreshTokenModel.fromJason(Map<String, dynamic> jasonData) {
    return RefreshTokenModel(
      token: jasonData["access_token"],
    );
  }
}
