import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/features/auth/data/mapper/auth_mapper.dart';
import 'package:onboarding_winter_project/features/auth/data/models/login_response.dart';
import 'package:onboarding_winter_project/features/auth/domain/entities/login_entity.dart';
import 'package:onboarding_winter_project/features/auth/domain/entities/login_request_entity.dart';
import 'package:onboarding_winter_project/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<ApiResult<LoginEntity>> call(LoginRequestEntity requestEntity) async {
    ApiResult<LoginResponse> response = await _authRepository.login(
      AuthMapper.mapToRequestModel(requestEntity),
    );
    if (response is Success) {
      Success success = response as Success;
      return Success(AuthMapper.mapToEntity(success.data));
    } else {
      Failure failure = response as Failure;
      return Failure(failure.exception);
    }
  }
}
