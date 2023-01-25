import 'package:flutter_bloc/flutter_bloc.dart';

class AmountAlertBoxCubit extends Cubit<bool?> {
  AmountAlertBoxCubit() : super(null);

  showAlert() {
    emit(true);
  }

  hideAlert() {
    emit(false);
  }
}
