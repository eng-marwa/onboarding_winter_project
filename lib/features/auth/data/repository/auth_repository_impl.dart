import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/features/auth/data/data_sources/remote/remote_data_source.dart';
import 'package:onboarding_winter_project/features/auth/data/models/login_request_model.dart';
import 'package:onboarding_winter_project/features/auth/data/models/login_response.dart';
import 'package:onboarding_winter_project/features/auth/domain/entities/login_entity.dart';
import 'package:onboarding_winter_project/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource _remoteDataSource;
  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResult<LoginResponse>> login(LoginRequestModel request) {
    return _remoteDataSource.login(request);
  }

  // void register(String username, String password) {}
  //
  // void logout() {}
  //
  // void forgetPassword(String email) {}
}
