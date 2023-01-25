import 'dart:async';

import 'package:black_bull_markets/application/internal_transfer/internal_transfer_bloc/internal_transfer_event.dart';
import 'package:black_bull_markets/application/internal_transfer/internal_transfer_bloc/internal_transfer_state.dart';
import 'package:black_bull_markets/domain/core/error_handling/failures.dart';
import 'package:black_bull_markets/domain/internal_transfer/response/internal_transfer_response.dart';
import 'package:black_bull_markets/infrastructure/internal_transfer/internal_transfer_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternalTransferBloc
    extends Bloc<InternalTransferEvent, InternalTransferState> {
  InternalTransferBloc({
    required this.internalTransferRepository,
  }) : super(InternalTransferStateInitial()) {
    on<TransferInternalFundEvent>(_onTransferInternalFundEvent);
  }

  final InternalTransferRepository internalTransferRepository;

  Future<void> _onTransferInternalFundEvent(
    TransferInternalFundEvent event,
    Emitter<InternalTransferState> emit,
  ) async {
    emit(InternalTransferStateLoading());
    if (kDebugMode) {
      print(event.internalTransfer.toJson());
    }
    final response = await internalTransferRepository.transferFunds(
      internalTransfer: event.internalTransfer,
    );
    response.fold(
      (FailureEntity failure) => emit(
        InternalTransferStateError(
          message: failure.toString(),
        ),
      ),
      (InternalTransferResponse internalTransferResponse) => emit(
        InternalTransferStateLoaded(
          internalTransferResponse: internalTransferResponse,
        ),
      ),
    );
  }
}
