import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:black_bull_markets/domain/internal_transfer/request/internal_transfer.dart';
import 'package:black_bull_markets/domain/internal_transfer/response/internal_transfer_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class IInternalTransferRepository {
  Future<Either<FailureEntity, InternalTransferResponse>> transferFunds({
    required InternalTransfer internalTransfer,
  });
}
