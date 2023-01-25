import 'package:flutter_bloc/flutter_bloc.dart';

class AddFundRadioAmountIndex extends Cubit<int?> {
  AddFundRadioAmountIndex() : super(null);

  onAmountSelected(int index) {
    emit(index);
  }
}
