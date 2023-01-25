// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mywallet_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MyWalletRemoteDataSource implements MyWalletRemoteDataSource {
  _MyWalletRemoteDataSource(
    this._dio,
  );

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MyWalletResponse> getMyWallets() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<MyWalletResponse>(
        Options(
          method: 'GET',
          headers: _headers,
          extra: _extra,
        )
            .compose(
              _dio.options,
              '/my_wallets',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );
    final value = MyWalletResponse.fromJson(_result.data!);
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
