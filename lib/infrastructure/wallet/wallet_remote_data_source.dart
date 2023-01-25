import 'package:black_bull_markets/domain/wallet/wallet_item.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'wallet_remote_data_source.g.dart';

@RestApi()
abstract class WalletRemoteDataSource {
  factory WalletRemoteDataSource(
    Dio dioBuilder,
  ) = _WalletRemoteDataSource;

  @GET('/get_wallet')
  Future<List<WalletItem>> getWalletItems();
}
