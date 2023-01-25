import 'package:black_bull_markets/domain/internal_transfer/request/internal_transfer.dart';
import 'package:black_bull_markets/domain/internal_transfer/response/internal_transfer_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'internal_transfer_remote_data_source.g.dart';

@RestApi()
abstract class InternalTransferRemoteSource {
  factory InternalTransferRemoteSource(
    Dio dioBuilder,
  ) = _InternalTransferRemoteSource;

  @POST('/my_wallets')
  Future<InternalTransferResponse> transferInternalFunds({
    required InternalTransfer internalTransfer,
  });
}
