import 'package:dio/dio.dart';

class NetworkProvider {
  String? cookie;

  static Dio instance({required String cookie}) {
    final dio = Dio(
      BaseOptions(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    //authorization=authorization;
    //  dio.options.contentType = contentType ?? Headers.formUrlEncodedContentType;
    dio.options.headers['language'] = 'en';
    //dio.options.headers["ApiEncrypted"] = "true";
    dio.options.headers['cookie'] = cookie;
    //  dio.options.headers['Content-Type']= contentType ?? "application/x-www-form-urlencoded";
    dio.options.headers['Accept'] = 'application/json';
    //dio.options.connectTimeout = 10000;
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    // dio.interceptors.add(alice.getDioInterceptor());
    // dio.interceptors.add(alice.showInspector());

    return dio;
  }
}

class HttpLogInterceptor extends InterceptorsWrapper {
  // @override
  // Future onRequest(RequestOptions options) async {
  //   print("onRequest: ${options.uri}\n"
  //       "data=${options.data}\n"
  //       "method=${options.method}\n"
  //       "headers=${options.headers}\n"
  //       "queryParameters=${options.queryParameters}");
  //   return options;
  // }
  //
  // @override
  // Future onResponse(Response response) {
  //   print("onResponse: $response");
  //   return super.onResponse(response);
  // }
  //
  // @override
  // Future onError(DioError err) {
  //   print("onError: $err\n"
  //       "Response: ${err.response}");
  //   return super.onError(err);
  // }
}
