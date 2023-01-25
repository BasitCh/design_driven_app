// ignore_for_file: always_specify_types

import 'package:black_bull_markets/domain/accounts/account_type_validation.dart';
import 'package:black_bull_markets/domain/accounts/currency_validation.dart';
import 'package:black_bull_markets/domain/accounts/leverage_validation.dart';
import 'package:black_bull_markets/domain/accounts/platform_type_validation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'create_account_event.dart';

part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc() : super(const CreateAccountState()) {
    on<PlateFormTypeChanged>(_onPlatFormTypeChanged);
    on<CurrencyChanged>(_onCurrencyChanged);
    on<AccountTypeChanged>(_onAccountTypeChanged);
    on<LeverageChanged>(_onLeverageChanged);
    on<LiveAccountSubmitted>(_onSubmitted);
  }

  void _onPlatFormTypeChanged(
    PlateFormTypeChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    final PlatFormType platFormType = PlatFormType.dirty(event.platFormType);
    emit(
      state.copyWith(
        platFormType: platFormType,
        status: Formz.validate(
          [platFormType, state.currency, state.accountType, state.leverage],
        ),
      ),
    );
  }

  void _onCurrencyChanged(
    CurrencyChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    final Currency currency = Currency.dirty(event.currency);
    emit(
      state.copyWith(
        currency: currency,
        status: Formz.validate(
            [currency, state.platFormType, state.accountType, state.leverage],),
      ),
    );
  }

  void _onAccountTypeChanged(
    AccountTypeChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    final AccountType accountType = AccountType.dirty(event.accountType);
    emit(
      state.copyWith(
        accountType: accountType,
        status: Formz.validate(
            [accountType, state.currency, state.platFormType, state.leverage],),
      ),
    );
  }

  void _onLeverageChanged(
    LeverageChanged event,
    Emitter<CreateAccountState> emit,
  ) {
    final Leverage leverage = Leverage.dirty(event.leverage);
    emit(
      state.copyWith(
        leverage: leverage,
        status: Formz.validate(
            [leverage, state.currency, state.platFormType, state.accountType],),
      ),
    );
  }

  void _onSubmitted(
    LiveAccountSubmitted event,
    Emitter<CreateAccountState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionSuccess));
    // if (state.status.isValidated) {
    //   emit(state.copyWith(status: FormzStatus.submissionInProgress));
    //   try {
    //     // await getIt<AwsAuthenticationService>().signIn(
    //     //   username: state.username.value,
    //     //   password: state.password.value,
    //     // );
    //     emit(state.copyWith(status: FormzStatus.submissionSuccess));
    //   } catch (_) {
    //     emit(state.copyWith(status: FormzStatus.submissionFailure));
    //   }
    // }
  }
}
