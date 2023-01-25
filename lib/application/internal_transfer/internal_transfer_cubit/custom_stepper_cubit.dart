import 'package:black_bull_markets/application/internal_transfer/internal_transfer_bloc/internal_transfer_bloc.dart';
import 'package:black_bull_markets/application/internal_transfer/internal_transfer_bloc/internal_transfer_event.dart';
import 'package:black_bull_markets/domain/internal_transfer/request/internal_transfer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomStepperCubit extends Cubit<int> {
  CustomStepperCubit() : super(1);

  int index = 1;

  onStepTapped(int stepNumber) {
    if (kDebugMode) {
      print(stepNumber);
    }
    index = stepNumber + 1;
    emit(index);
  }

  continued(
    BuildContext context, {
    InternalTransfer? internalTransfer,
  }) {
    if (kDebugMode) {
      print(internalTransfer);
    }
    state < 2
        ? emit(index += 1)
        : internalTransfer == null || internalTransfer.fromAccountName!.isEmpty
            ? null
            : context.read<InternalTransferBloc>().add(
                  TransferInternalFundEvent(
                    internalTransfer: internalTransfer,
                  ),
                );
  }

  cancel() {
    state < 2 ? emit(index -= 1) : null;
    // state > 1
    //     ? setState(() {
    //   _step -= 1;
    // })
    //     : null;
  }
}
