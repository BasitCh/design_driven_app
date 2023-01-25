import 'package:black_bull_markets/domain/internal_transfer/request/internal_transfer.dart';
import 'package:equatable/equatable.dart';

abstract class InternalTransferEvent extends Equatable {}

class TransferInternalFundEvent extends InternalTransferEvent {
  TransferInternalFundEvent({
    required this.internalTransfer,
  });
  final InternalTransfer internalTransfer;

  @override
  List<Object?> get props => [];
}
