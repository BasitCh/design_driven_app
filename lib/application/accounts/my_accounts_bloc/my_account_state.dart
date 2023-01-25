part of 'my_account_bloc.dart';

abstract class MyAccountState extends Equatable {}

class MyAccountStateInitial extends MyAccountState {
  @override
  List<Object?> get props => [];
}

class MyAccountStateLoading extends MyAccountState {
  MyAccountStateLoading();

  @override
  List<Object?> get props => [];
}

class MyAccountStateLoaded extends MyAccountState {
  final MyAccountResponse myAccountResponse;
  final List<MyAccountCardItem> sliderWidgets;
  MyAccountStateLoaded({
    required this.myAccountResponse,
    required this.sliderWidgets,
  });

  @override
  List<Object?> get props => [
        myAccountResponse,
        sliderWidgets,
      ];
}

class MyAccountStateError extends MyAccountState {
  final String message;
  MyAccountStateError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
