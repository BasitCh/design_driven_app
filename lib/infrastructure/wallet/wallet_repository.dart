import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:black_bull_markets/domain/wallet/i_wallet_repository.dart';
import 'package:black_bull_markets/domain/wallet/wallet_item.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/infrastructure/wallet/wallet_remote_data_source.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
// ignore: implementation_imports
import 'package:fpdart/src/either.dart';

class WalletRepository implements IWalletRepository {
  WalletRepository({required this.walletRemoteDataSource});

  final WalletRemoteDataSource walletRemoteDataSource;
  @override
  Future<Either<FailureEntity, List<WalletItem>>> getWalletList() async {
    try {
      // final List<WalletItem> response = await walletRemoteDataSource.getWalletItems();
      await Future.delayed(const Duration(seconds: 1));
      List<WalletItem> response = const <WalletItem>[
        WalletItem(
          id: '1',
          title: 'My Wallet',
          imageUrl: BlackBullIcons.myWallet,
          routeName: NavigationService.myWalletRouteUri,
        ),
        WalletItem(
          id: '2',
          title: 'Add funds',
          imageUrl: BlackBullIcons.addFunds,
          routeName: NavigationService.addFundsRouteUri,
        ),
        WalletItem(
          id: '3',
          title: 'Withdraw',
          imageUrl: BlackBullIcons.withdraw,
          routeName: NavigationService.withdrawRouteUri,
        ),
        WalletItem(
          id: '4',
          title: 'Internal transfer',
          imageUrl: BlackBullIcons.internalTransfer,
          routeName: NavigationService.internalTransferRouteUri,
        ),
        WalletItem(
          id: '5',
          title: 'History',
          imageUrl: BlackBullIcons.history,
          routeName: NavigationService.historyRouteUri,
        ),
      ];
      return right(response);
    } on Exception {
      return left(const FailureEntity.serverFailure());
    }
  }
}
