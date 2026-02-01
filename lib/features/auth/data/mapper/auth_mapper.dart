import 'package:onboarding_winter_project/features/auth/data/models/login_request_model.dart';
import 'package:onboarding_winter_project/features/auth/data/models/login_response.dart';
import 'package:onboarding_winter_project/features/auth/domain/entities/login_entity.dart';
import 'package:onboarding_winter_project/features/auth/domain/entities/login_request_entity.dart';

class AuthMapper {
  AuthMapper._();

  static LoginEntity mapToEntity(LoginResponse response) {
    return LoginEntity(
      id: response.id,
      username: response.username,
      email: response.email,
      fullName: '${response.firstName}${response.lastName}',
      gender: response.gender,
      image: response.image,
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );
  }

  static LoginResponse mapToResponse(LoginEntity entity) {
    return LoginResponse(
      id: entity.id,
      username: entity.username,
      email: entity.email,
      firstName: entity.fullName?.split(' ').first,
      lastName: entity.fullName?.split(' ').last,
      gender: entity.gender,
      image: entity.image,
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
    );
  }

  static LoginRequestModel mapToRequestModel(LoginRequestEntity entity) {
    return LoginRequestModel(
      username: entity.username,
      password: entity.password,
    );
  }
}
