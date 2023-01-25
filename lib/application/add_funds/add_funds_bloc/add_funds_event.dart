part of 'add_funds_bloc.dart';

abstract class AddFundsEvent extends Equatable {}

class SubmitTransferFunds extends AddFundsEvent{
  SubmitTransferFunds({required this.addFunds,});
  final AddFunds addFunds;
  @override
  List<Object?> get props => [];

}
