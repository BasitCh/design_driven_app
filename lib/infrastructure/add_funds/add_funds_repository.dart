// ignore_for_file: implementation_imports

import 'package:black_bull_markets/domain/add_funds/i_add_funds_repository.dart';
import 'package:black_bull_markets/domain/add_funds/request/add_funds.dart';
import 'package:black_bull_markets/domain/add_funds/response/add_funds_response.dart';
import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:black_bull_markets/infrastructure/add_funds/add_funds_remote_data_source.dart';
import 'package:fpdart/src/either.dart';

class AddFundsRepository implements IAddFundsRepository {
  AddFundsRepository({
    required this.addFundsRemoteDataSource,
  });
  final AddFundsRemoteDataSource addFundsRemoteDataSource;

  @override
  Future<Either<FailureEntity, AddFundsResponse>> addFunds(
      {required AddFunds addFunds}) async {
    try {
      // final AddFundsResponse response = await addFundsRemoteDataSource.addFunds();
      await Future.delayed(
        const Duration(
          seconds: 2,
        ),
      );
      AddFundsResponse response = AddFundsResponse(
        message: 'Funds added successfully.',
      );
      return right(response);
    } on Exception {
      return left(const FailureEntity.serverFailure());
    }
  }
}
