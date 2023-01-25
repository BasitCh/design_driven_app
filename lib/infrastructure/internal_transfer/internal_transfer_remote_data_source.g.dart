// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internal_transfer_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _InternalTransferRemoteSource implements InternalTransferRemoteSource {
  _InternalTransferRemoteSource(
    this._dio,
  );

  final Dio _dio;

  String? baseUrl;

  @override
  Future<InternalTransferResponse> transferInternalFunds({
    required internalTransfer,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
      _setStreamType<InternalTransferResponse>(
        Options(
          method: 'POST',
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
    final value = InternalTransferResponse.fromJson(_result.data!);
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
