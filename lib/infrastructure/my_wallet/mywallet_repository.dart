// ignore_for_file: implementation_imports

import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:black_bull_markets/domain/my_wallet/i_mywallet_repository.dart';
import 'package:black_bull_markets/domain/my_wallet/my_wallet.dart';
import 'package:black_bull_markets/domain/my_wallet/response/my_wallet_response.dart';

import 'package:black_bull_markets/infrastructure/my_wallet/mywallet_remote_data_source.dart';
import 'package:fpdart/src/either.dart';

class MyWalletRepository implements IMyWalletRepository {
  final MyWalletRemoteDataSource myWalletRemoteDataSource;

  MyWalletRepository({
    required this.myWalletRemoteDataSource,
  });

  @override
  Future<Either<FailureEntity, MyWalletResponse>> getMyWallets() async {
    try {
      await Future.delayed(
        const Duration(
          milliseconds: 500,
        ),
      );
      // final response = await myWalletRemoteDataSource.getMyWallets();
      final response = MyWalletResponse(
        myWallets: [
          MyWallet(
            id: '1',
            name: 'John',
            balance: 74.3,
            currency: 'NZD',
            color: '69BE28',
          ),
          MyWallet(
            id: '2',
            name: 'Cindrela',
            balance: 100,
            currency: 'USD',
            color: '1A58D3',
          ),
          // MyWallet(
          //   id: '3',
          //   name: 'Abdul Rehman',
          //   balance: 987,
          //   currency: 'SAR',
          //   color: '69BE28',
          // ),
          // MyWallet(
          //   id: '2',
          //   name: 'Cindrela',
          //   balance: 100,
          //   currency: 'USD',
          //   color: '1A58D3',
          // ),
          // MyWallet(
          //   id: '1',
          //   name: 'John',
          //   balance: 74.3,
          //   currency: 'NZD',
          //   color: '69BE28',
          // ),
          // MyWallet(
          //   id: '2',
          //   name: 'Cindrela',
          //   balance: 100,
          //   currency: 'USD',
          //   color: '1A58D3',
          // ),
          // MyWallet(
          //   id: '3',
          //   name: 'Abdul Rehman',
          //   balance: 987,
          //   currency: 'SAR',
          //   color: '69BE28',
          // ),
        ],
      );
      return right(response);
    } on Exception {
      return left(const FailureEntity.serverFailure());
    }
  }
}
