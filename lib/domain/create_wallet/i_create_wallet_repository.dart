import 'package:black_bull_markets/domain/core/error_handling/error_handling.dart';
import 'package:black_bull_markets/domain/create_wallet/request/create_wallet_request.dart';
import 'package:black_bull_markets/domain/create_wallet/response/create_wallet_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class ICreateWalletRepository {
  Future<Either<FailureEntity, CreateWalletResponse>> createNewWallet({
  required CreateWalletRequest createWalletRequest,
});
}
