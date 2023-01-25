// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _SignUpRemoteDataSource implements SignUpRemoteDataSource {
  _SignUpRemoteDataSource(this._dio) {
    baseUrl ??= 'https://dev3.blackbullmarkets.com/api/1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<EmailAvailabilityResponse> checkEmail(emailAvailabilityRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(emailAvailabilityRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<EmailAvailabilityResponse>(
        Options(
          method: 'POST',
          headers: _headers,
          extra: _extra,
        )
            .compose(
              _dio.options,
              '/register/email-availability',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );
    final value = EmailAvailabilityResponse.fromJson(_result.data!);
    return value;
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
