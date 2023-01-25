import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:black_bull_markets/domain/create_wallet/request/create_wallet_request.dart';
import 'package:black_bull_markets/domain/create_wallet/response/create_wallet_response.dart';

import 'package:black_bull_markets/infrastructure/create_wallet/createwallet_repository.dart';
// ignore: implementation_imports
import 'package:fpdart/src/either.dart';
import 'package:mockito/mockito.dart';

class CreateWalletRepositoryMock extends Mock
    implements CreateWalletRepository {
  @override
  Future<Either<FailureEntity, CreateWalletResponse>> createNewWallet({
    required CreateWalletRequest createWalletRequest,
  }) async {
    try {
      CreateWalletResponse response = CreateWalletResponse(
        message: 'Wallet created successfully',
      );
      return right(response);
    } on Exception {
      return left(const FailureEntity.serverFailure());
    }
  }
}
