import 'package:flutter/material.dart';
import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/features/auth/domain/entities/login_request_entity.dart';
import 'package:onboarding_winter_project/features/auth/domain/use_cases/login_use_case.dart';

class AuthProvider {
  final LoginUseCase _loginUseCase;

  AuthProvider(this._loginUseCase);

  Future<void> login(String username, String password) async {
    ApiResult result = await _loginUseCase.call(
      LoginRequestEntity(username, password),
    );
    if (result is Success) {
      debugPrint(result.data.accessToken);
    } else {
      debugPrint((result as Failure).exception.errorMessage);
    }
  }
}
