import 'package:dio/dio.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  final String userAgentKey = 'User-Agent';
  final String authHeaderKey = 'authorizationToken';
  final String bearer = 'Bearer';

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers[authHeaderKey] = 'dQF4a3nu6U0NJqyDQWN9qXHsmMAvLQED';
    handler.next(options);
  }
}
