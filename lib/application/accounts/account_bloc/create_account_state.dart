part of 'create_account_bloc.dart';

class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.status = FormzStatus.pure,
    this.platFormType = const PlatFormType.pure(),
    this.currency = const Currency.pure(),
    this.accountType = const AccountType.pure(),
    this.leverage = const Leverage.pure(),
  });

  final FormzStatus status;
  final PlatFormType platFormType;
  final Currency currency;
  final AccountType accountType;
  final Leverage leverage;

  CreateAccountState copyWith({
    FormzStatus? status,
    PlatFormType? platFormType,
    Currency? currency,
    AccountType? accountType,
    Leverage? leverage,
  }) {
    return CreateAccountState(
      status: status ?? this.status,
      platFormType: platFormType ?? this.platFormType,
      currency: currency ?? this.currency,
      accountType: accountType ?? this.accountType,
      leverage: leverage ?? this.leverage,
    );
  }

  @override
  List<Object> get props => <Object>[status, platFormType, currency,accountType,leverage];
}
