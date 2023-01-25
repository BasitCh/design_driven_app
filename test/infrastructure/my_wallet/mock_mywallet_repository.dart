import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:black_bull_markets/domain/my_wallet/my_wallet.dart';
import 'package:black_bull_markets/domain/my_wallet/response/my_wallet_response.dart';
import 'package:black_bull_markets/infrastructure/my_wallet/mywallet_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/mockito.dart';

class MyWalletRepositoryMock extends Mock implements MyWalletRepository {
  @override
  Future<Either<FailureEntity, MyWalletResponse>> getMyWallets() async {
    try {
      await Future.delayed(
        const Duration(
          milliseconds: 500,
        ),
      );
      // final response = await myWalletRemoteDataSource.getMyWallets();
      final response = MyWalletRemoteDataSource.getWalletResponse();
      return right(response);
    } on Exception {
      return left(const FailureEntity.serverFailure());
    }
  }
}

class MyWalletRemoteDataSource {
  static MyWalletResponse response = MyWalletResponse(
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
  static MyWalletResponse getWalletResponse() {
    return response;
  }
}
