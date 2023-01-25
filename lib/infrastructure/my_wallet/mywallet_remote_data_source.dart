import 'package:black_bull_markets/domain/my_wallet/response/my_wallet_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'mywallet_remote_data_source.g.dart';

@RestApi()
abstract class MyWalletRemoteDataSource {
  factory MyWalletRemoteDataSource(
    Dio dioBuilder,
  ) = _MyWalletRemoteDataSource;

  @GET('/my_wallets')
  Future<MyWalletResponse> getMyWallets();
}
