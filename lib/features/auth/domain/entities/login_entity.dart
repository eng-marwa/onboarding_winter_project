class LoginEntity {
  final int? id;
  final String? username;
  final String? email;
  final String? fullName;
  final String? gender;
  final String? image;
  final String? accessToken;
  final String? refreshToken;
  final bool? defaultUser;

  LoginEntity({
    this.id,
    this.username,
    this.email,
    this.fullName,
    this.gender,
    this.image,
    this.accessToken,
    this.refreshToken,
    this.defaultUser,
  });
}
