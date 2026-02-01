import 'package:dio/dio.dart';

class ApiException {
  final int? errorCode;
  final String? errorMessage;

  ApiException({this.errorCode, this.errorMessage});

  static ApiException handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(errorMessage: 'Timeout, try again later');
      case DioExceptionType.badResponse:
      case DioExceptionType.unknown:
        return ApiException(
          errorCode: error.response?.statusCode ?? 0,
          errorMessage: error.response?.statusMessage ?? error.message,
        );
      case DioExceptionType.cancel:
        return ApiException(errorMessage: 'Request canceled');
      case DioExceptionType.badCertificate:
        return ApiException(errorMessage: error.message);
      case DioExceptionType.connectionError:
        return ApiException(errorMessage: error.message);
    }
  }
}
