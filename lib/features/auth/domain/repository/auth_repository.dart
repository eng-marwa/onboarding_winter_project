import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/features/auth/data/models/login_request_model.dart';
import 'package:onboarding_winter_project/features/auth/data/models/login_response.dart';

abstract class AuthRepository {
  Future<ApiResult<LoginResponse>> login(LoginRequestModel request);
  // Future<ApiResult<SignUpResponse>> register(String username, String password);
  // Future<ApiResult<void>> logout();
  // Future<ApiResult<void>> forgetPassword(String email);
}
