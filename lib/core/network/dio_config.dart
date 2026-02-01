import 'package:dio/dio.dart';
import 'package:onboarding_winter_project/core/network/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConfig {
  DioConfig._();

  static final Duration _timeout = const Duration(seconds: 10);

  static Dio getDio() {
    Dio dio = Dio();
    dio
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = _timeout
      ..options.receiveTimeout = _timeout
      ..options.headers = {'Content-Type': 'application/json'}
      ..interceptors.addAll([
        PrettyDioLogger(responseBody: true, requestBody: true),
        // DioCacheInterceptor(
        //   options: CacheOptions(
        //     store: cacheStore,
        //     policy: CachePolicy.forceCache,
        //     maxStale: const Duration(days: 7),
        //   ),
        // ),
        // RetryInterceptor(dio: dio),
      ]);
    return dio;
  }
}

class RetryInterceptor extends InterceptorsWrapper {
  final Dio dio;
  final int retries;

  final Duration delay;

  RetryInterceptor({
    required this.dio,
    this.retries = 3,
    this.delay = const Duration(seconds: 1),
  });

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    try {
      if (_checkError(err)) {
        Response response = await _retry(err.requestOptions);
        handler.resolve(response);
      }
    } catch (e) {
      handler.next(err);
    }

    handler.next(err);
  }

  bool _checkError(DioException err) {
    int count = 0;
    if (count == retries) return false;
    count++;
    return err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.response?.statusCode == null &&
            (err.response?.statusCode == 500 ||
                err.response?.statusCode == 502 ||
                err.response?.statusCode == 503);
  }

  Future<Response> _retry(RequestOptions options) async {
    await Future.delayed(delay);
    return dio.fetch(options);
  }
}

/*
Don't use cache
login
payments
sensitive data

 */
