// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'i_login_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ILoginRepository implements ILoginRepository {
  _ILoginRepository(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://dev3.blackbullmarkets.com/api/1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Response<dynamic>> login({
    cookie,
    required loginRequest,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{r'cookie': cookie};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(loginRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<Response<dynamic>>(
        Options(
          method: 'POST',
          headers: _headers,
          extra: _extra,
        )
            .compose(
              _dio.options,
              '/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );
    // final value = Response<dynamic>.fromJson(_result.data!);
    return _result;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
