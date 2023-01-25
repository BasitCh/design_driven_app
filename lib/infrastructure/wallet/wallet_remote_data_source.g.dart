// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _WalletRemoteDataSource implements WalletRemoteDataSource {
  _WalletRemoteDataSource(
    this._dio,
  );

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<WalletItem>> getWalletItems() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
      _setStreamType<List<WalletItem>>(
        Options(
          method: 'GET',
          headers: _headers,
          extra: _extra,
        )
            .compose(
              _dio.options,
              '/get_wallet',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );
    var value = _result.data!
        .map((dynamic i) => WalletItem.fromJson(i as Map<String, dynamic>))
        .toList();
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
