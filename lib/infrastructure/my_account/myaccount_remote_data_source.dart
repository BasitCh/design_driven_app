import 'package:black_bull_markets/domain/my_account/my_account_response/my_account_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'myaccount_remote_data_source.g.dart';

@RestApi()
abstract class MyAccountRemoteDataSource {
  factory MyAccountRemoteDataSource(
    Dio dioBuilder,
  ) = _MyAccountRemoteDataSource;

  @GET('/my_accounts')
  Future<MyAccountResponse> getMyAccounts();
}
