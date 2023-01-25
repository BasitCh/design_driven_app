part of 'wallet_bloc.dart';

abstract class WalletState extends Equatable {
  const WalletState();

  @override
  // ignore: always_specify_types
  List<Object> get props => [];
}

class WalletStateInitial extends WalletState {}

class WalletStateLoading extends WalletState {}

// ignore: must_be_immutable
class WalletStateLoaded extends WalletState {
  WalletStateLoaded({
    required this.walletItems,
    this.isNavigated = false,
    this.walletItem,
  });
  List<WalletItem> walletItems;
  final bool isNavigated;
  final WalletItem? walletItem;

  @override
  List<Object> get props => <Object>[walletItems];

  @override
  String toString() => 'Wallet List { items:  }';
}

class WalletStateError extends WalletState {
  const WalletStateError({
    required this.message,
  });
  final String message;
}
