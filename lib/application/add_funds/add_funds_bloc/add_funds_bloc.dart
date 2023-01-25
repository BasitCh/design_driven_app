import 'dart:async';

import 'package:black_bull_markets/domain/add_funds/request/add_funds.dart';
import 'package:black_bull_markets/domain/add_funds/response/add_funds_response.dart';
import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:black_bull_markets/infrastructure/add_funds/add_funds_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_funds_event.dart';

part 'add_funds_state.dart';

class AddFundsBloc extends Bloc<AddFundsEvent, AddFundsState> {
  AddFundsBloc({
    required this.addFundsRepository,
  }) : super(
          AddFundsStateInitial(),
        ) {
    on<SubmitTransferFunds>(_onSubmitFund);
  }

  final AddFundsRepository addFundsRepository;

  static TextEditingController amountTextEditingController = TextEditingController();

  Future<void> _onSubmitFund(
    SubmitTransferFunds event,
    Emitter<AddFundsState> emit,
  ) async {
    emit(AddFundsStateAdding());
    final response = await addFundsRepository.addFunds(
      addFunds: event.addFunds,
    );
    response.fold(
      (FailureEntity failure) => emit(
        AddFundsStateError(
          message: failure.toString(),
        ),
      ),
      (AddFundsResponse addFundsResponse) => emit(
        AddFundsStateAdded(
          addFundsResponse: addFundsResponse,
        ),
      ),
    );
  }
}
