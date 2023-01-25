part of 'my_account_bloc.dart';

abstract class MyAccountEvent extends Equatable {}

class FetchMyAccountItems extends MyAccountEvent {
  FetchMyAccountItems();

  @override
  List<Object?> get props => [];
}
