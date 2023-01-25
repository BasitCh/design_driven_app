part of 'wallet_bloc.dart';

abstract class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  // ignore: always_specify_types
  List<Object> get props => [];
}

class FetchWalletItems extends WalletEvent {}

class NavigateToNext extends WalletEvent {
  const NavigateToNext({required this.walletItem});
  final WalletItem walletItem;
}
