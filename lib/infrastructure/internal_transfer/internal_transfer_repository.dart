import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:black_bull_markets/domain/internal_transfer/i_internal_transfer_repository.dart';
import 'package:black_bull_markets/domain/internal_transfer/request/internal_transfer.dart';
import 'package:black_bull_markets/domain/internal_transfer/response/internal_transfer_response.dart';
import 'package:black_bull_markets/infrastructure/internal_transfer/internal_transfer_remote_data_source.dart';
import 'package:fpdart/fpdart.dart';
// ignore: implementation_imports
import 'package:fpdart/src/either.dart';

class InternalTransferRepository implements IInternalTransferRepository {
  InternalTransferRepository({required this.internalTransferRemoteSource});

  final InternalTransferRemoteSource internalTransferRemoteSource;

  @override
  Future<Either<FailureEntity, InternalTransferResponse>> transferFunds({
    required InternalTransfer internalTransfer,
  }) async {
    try {
      await Future.delayed(
        const Duration(
          milliseconds: 300,
        ),
      );
      // final response = await internalTransferRemoteSource.transferInternalFunds(internalTransfer: internalTransfer,);
      final response = InternalTransferResponse(
        message:
            'Funds of ${internalTransfer.amount} ${internalTransfer.currency} transferred successfully.',
      );
      return right(response);
    } on Exception {
      return left(const FailureEntity.serverFailure());
    }
  }
}
