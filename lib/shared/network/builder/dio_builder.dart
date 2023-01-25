// import 'package:black_bull_markets/shared/network/interceptor/header_interceptor.dart';
// import 'package:dio/adapter.dart';
// import 'package:dio/adapter_browser.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
//
// class DioBuilder extends DioMixin implements Dio {
//   // create basic information for request
//   final String contentType = 'application/json';
//   final int connectionTimeOutMls = 190000;
//   final int readTimeOutMls = 190000;
//   final int writeTimeOutMls = 190000;
//
//   static DioBuilder getInstance({
//     bool ignoredToken = false,
//     BaseOptions? options,
//   }) =>
//       DioBuilder._(ignoredToken, options);
//
//   DioBuilder._(bool ignoredToken, [BaseOptions? options]) {
//     options = BaseOptions(
//       baseUrl: options?.baseUrl ??
//           'https://m6m7k44uxf.execute-api.eu-central-1.amazonaws.com/v1/api',
//       contentType: contentType,
//       connectTimeout: connectionTimeOutMls,
//       receiveTimeout: readTimeOutMls,
//       sendTimeout: writeTimeOutMls,
//       // headers: {
//       // 'authorizationToken': 'dQF4a3nu6U0NJqyDQWN9qXHsmMAvLQED',
//       // }
//     );
//
//     this.options = options;
//
//     // Config cache
//     // final cacheConfig = CacheConfig(baseUrl: Constants.shared().endpoint);
//     // interceptors.add(DioCacheManager(cacheConfig).interceptor as InterceptorsWrapper);
//
//     // Debug mode
//     // if (kDebugMode) {
//     interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
//     //}
//
//     // Add default user agent
//     interceptors.add(HeaderInterceptor());
//
//     // token
//     // if (!ignoredToken) {
//     //   interceptors.add(TokenInterceptor(currentDio: this));
//     // }
//
//     // create default http client
//     // If you want run for web, please use httpClientAdapter from BrowserHttpClientAdapter
//     if (kIsWeb) {
//       httpClientAdapter = BrowserHttpClientAdapter();
//     } else {
//       httpClientAdapter = DefaultHttpClientAdapter();
//     }
//   }
// }
