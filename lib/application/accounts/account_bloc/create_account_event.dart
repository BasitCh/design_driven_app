// ignore_for_file: always_specify_types

part of 'create_account_bloc.dart';

abstract class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();
  @override
  List<Object> get props => [];
}

class PlateFormTypeChanged extends CreateAccountEvent {
  const PlateFormTypeChanged(this.platFormType);

  final String platFormType;

  @override
  List<Object> get props => [platFormType];
}

class CurrencyChanged extends CreateAccountEvent {
  const CurrencyChanged(this.currency);

  final String currency;

  @override
  List<Object> get props => [currency];
}

class AccountTypeChanged extends CreateAccountEvent {
  const AccountTypeChanged(this.accountType);

  final String accountType;

  @override
  List<Object> get props => [accountType];
}

class LeverageChanged extends CreateAccountEvent {
  const LeverageChanged(this.leverage);

  final String leverage;

  @override
  List<Object> get props => [leverage];
}

class LiveAccountSubmitted extends CreateAccountEvent {
  const LiveAccountSubmitted();
}
