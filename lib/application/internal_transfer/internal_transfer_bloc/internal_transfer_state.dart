import 'package:black_bull_markets/domain/internal_transfer/response/internal_transfer_response.dart';
import 'package:equatable/equatable.dart';

abstract class InternalTransferState extends Equatable {}

class InternalTransferStateInitial extends InternalTransferState {
  @override
  List<Object?> get props => [];
}

class InternalTransferStateLoading extends InternalTransferState {
  @override
  List<Object?> get props => [];
}

class InternalTransferStateLoaded extends InternalTransferState {
  InternalTransferStateLoaded({
    required this.internalTransferResponse,
  });

  final InternalTransferResponse internalTransferResponse;
  @override
  List<Object?> get props => [internalTransferResponse];
}

class InternalTransferStateError extends InternalTransferState {
  InternalTransferStateError({
    required this.message,
  });
  final String message;
  @override
  List<Object?> get props => [];
}
