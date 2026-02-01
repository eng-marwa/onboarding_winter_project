import 'package:dio/dio.dart';
import 'package:onboarding_winter_project/core/network/api_constants.dart';
import 'package:onboarding_winter_project/core/network/api_exception.dart';
import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/core/network/dio_config.dart';
import 'package:onboarding_winter_project/features/auth/data/models/login_request_model.dart';
import 'package:onboarding_winter_project/features/auth/data/models/login_response.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);

  Future<ApiResult<LoginResponse>> login(LoginRequestModel request) async {
    try {
      Response response = await _dio.post(
        ApiConstants.loginEndPoint,
        data: request.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(LoginResponse.fromJson(response.data));
      } else {
        return Failure(
          ApiException(errorMessage: response.statusMessage ?? response.data),
        );
      }
    } on DioException catch (e) {
      return Failure(ApiException.handleError(e));
    } catch (e) {
      return Failure(ApiException(errorMessage: e.toString()));
    }
  }
}
