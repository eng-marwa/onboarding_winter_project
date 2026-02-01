import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/core/network/api_services.dart';
import 'package:onboarding_winter_project/features/auth/data/models/login_request_model.dart';
import 'package:onboarding_winter_project/features/auth/data/models/login_response.dart';

class RemoteDataSource {
  final ApiServices _apiServices;
  RemoteDataSource(this._apiServices);

  Future<ApiResult<LoginResponse>> login(LoginRequestModel request) {
    return _apiServices.login(request);
  }
}
