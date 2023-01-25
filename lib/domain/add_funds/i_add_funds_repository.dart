import 'package:black_bull_markets/domain/add_funds/request/add_funds.dart';
import 'package:black_bull_markets/domain/add_funds/response/add_funds_response.dart';
import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class IAddFundsRepository{
  Future<Either<FailureEntity, AddFundsResponse>> addFunds({
    required AddFunds addFunds,
  });
}
