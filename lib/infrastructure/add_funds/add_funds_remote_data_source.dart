import 'package:black_bull_markets/domain/add_funds/request/add_funds.dart';
import 'package:black_bull_markets/domain/add_funds/response/add_funds_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'add_funds_remote_data_source.g.dart';

@RestApi()
abstract class AddFundsRemoteDataSource {
  factory AddFundsRemoteDataSource(
      Dio dioBuilder,
      ) = _AddFundsRemoteDataSource;

  @POST('/mywallet/{walletid}')
  Future<AddFundsResponse> addFunds(@Body() AddFunds addFunds);
}
