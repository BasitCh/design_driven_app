import 'package:black_bull_markets/domain/internal_transfer/request/internal_transfer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternalTransferCubit extends Cubit<InternalTransfer> {
  InternalTransferCubit() : super(InternalTransfer.empty());

  onChangeFromWalletName(String value) {
    emit(
      state.copyWith(
        fromWalletName: value,
      ),
    );
  }

  onChangeFromAccountName(String value) {
    emit(
      state.copyWith(
        fromAccountName: value,
      ),
    );
  }

  onChangeToWalletName(String value) {
    emit(
      state.copyWith(
        toWalletName: value,
      ),
    );
  }

  onChangeToAccountName(String value) {
    emit(
      state.copyWith(
        toAccountName: value,
      ),
    );
  }

  onChangeAmount(String value) {
    emit(
      state.copyWith(
        amount: int.parse(value),
      ),
    );
  }
}
