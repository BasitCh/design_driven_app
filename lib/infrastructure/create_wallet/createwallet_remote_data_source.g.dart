// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createwallet_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CreateWalletRemoteDataSource implements CreateWalletRemoteDataSource {
  _CreateWalletRemoteDataSource(
    this._dio,
  );

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CreateWalletResponse> createNewWallet(createWalletRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createWalletRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<CreateWalletResponse>(
        Options(
          method: 'POST',
          headers: _headers,
          extra: _extra,
        )
            .compose(
              _dio.options,
              '/create_wallet',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
      ),
    );
    final value = CreateWalletResponse.fromJson(_result.data!);
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
