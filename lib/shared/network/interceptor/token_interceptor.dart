// ignore_for_file: deprecated_member_use, always_specify_types

import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  final Dio currentDio;
  final String auth = 'Authorization';
  final String bearer = 'Bearer';

  TokenInterceptor({required this.currentDio});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null && err.response?.statusCode == 401) {
      // ignore: todo
      // TODO Please refactor when token api ready
      // Lock all of request to request new token
      currentDio.lock();
      // request new token & save it
      //final String token = await requestToken();
      // unlock when token refreshed
      currentDio.unlock();

      // Re-call request
      final RequestOptions request = err.requestOptions;
      try {
        // Check header has Authentication
        if (request.headers.containsKey(auth)) {
          // Update the last value
          // request.headers.update(
          //     auth,
          //     (value) => (value.toString().contains(bearer) == true)
          //         ? '$bearer $token'
          //         : token);
        }

        final Response response = await currentDio.request(
          request.path,
          data: request.data,
          queryParameters: request.queryParameters,
          cancelToken: request.cancelToken,
          options: Options(
              method: request.method,
              sendTimeout: request.sendTimeout,
              extra: request.extra,
              headers: request.headers,
              responseType: request.responseType,
              contentType: request.contentType,
              receiveDataWhenStatusError: request.receiveDataWhenStatusError,
              followRedirects: request.followRedirects,
              maxRedirects: request.maxRedirects,
              requestEncoder: request.requestEncoder,
              responseDecoder: request.responseDecoder,
              listFormat: request.listFormat,),
          onReceiveProgress: request.onReceiveProgress,
        );

        handler.resolve(response);
      } on DioError catch (e) {
        handler.next(e);
      }
    }

    super.onError(err, handler);
  }
}
