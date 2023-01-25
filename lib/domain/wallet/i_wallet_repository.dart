import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:black_bull_markets/domain/wallet/wallet_item.dart';
import 'package:fpdart/fpdart.dart';

abstract class IWalletRepository {
  Future<Either<FailureEntity, List<WalletItem>>> getWalletList();
}
