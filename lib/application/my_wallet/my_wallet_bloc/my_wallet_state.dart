part of 'my_wallet_bloc.dart';

abstract class MyWalletState extends Equatable {}

class MyWalletStateInitial extends MyWalletState {
  @override
  List<Object?> get props => [];
}

class MyWalletStateLoading extends MyWalletState {
  MyWalletStateLoading();

  @override
  List<Object?> get props => [];
}

class MyWalletStateLoaded extends MyWalletState {
  final MyWalletResponse myWalletResponse;
  final List<MyWalletCardItem> sliderWidgets;
  MyWalletStateLoaded({
    required this.myWalletResponse,
    required this.sliderWidgets,
  });

  @override
  List<Object?> get props => [
        myWalletResponse,
        sliderWidgets,
      ];
}

class MyWalletStateError extends MyWalletState {
  final String message;
  MyWalletStateError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
