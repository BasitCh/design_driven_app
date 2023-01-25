import 'package:black_bull_markets/domain/create_wallet/request/create_wallet_request.dart';
import 'package:black_bull_markets/domain/create_wallet/response/create_wallet_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'createwallet_remote_data_source.g.dart';

@RestApi()
abstract class CreateWalletRemoteDataSource {
  factory CreateWalletRemoteDataSource(
      Dio dioBuilder,
      ) = _CreateWalletRemoteDataSource;

  @POST('/create_wallet')
  Future<CreateWalletResponse> createNewWallet(@Body() CreateWalletRequest createWalletRequest);
}
