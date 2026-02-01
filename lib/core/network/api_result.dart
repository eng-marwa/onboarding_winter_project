import 'package:onboarding_winter_project/core/network/api_exception.dart';

sealed class ApiResult<T> {}

class Success<T> extends ApiResult<T> {
  final T? data;

  Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final ApiException exception;

  Failure(this.exception);
}
