part of 'my_wallet_bloc.dart';

abstract class MyWalletEvent extends Equatable {}

class FetchMyWalletItems extends MyWalletEvent {
  FetchMyWalletItems({
    this.isAddFundsPage=false,
});
  final bool isAddFundsPage;

  @override
  List<Object?> get props => [];
}
