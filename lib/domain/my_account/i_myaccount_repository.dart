import 'package:black_bull_markets/domain/core/error_handling/error_handling.dart';
import 'package:black_bull_markets/domain/my_account/my_account_response/my_account_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class IMyAccountRepository {
  Future<Either<FailureEntity, MyAccountResponse>> getMyAccounts();
}
