import 'package:black_bull_markets/domain/core/error_handling/error_handling.dart';
import 'package:black_bull_markets/domain/my_wallet/response/my_wallet_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class IMyWalletRepository {
  Future<Either<FailureEntity, MyWalletResponse>> getMyWallets();
}
