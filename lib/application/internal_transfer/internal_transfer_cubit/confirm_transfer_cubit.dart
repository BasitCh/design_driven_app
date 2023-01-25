import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmTransferCubit extends Cubit<bool> {
  ConfirmTransferCubit() : super(false);

  onTap(bool? val) {
    val != val;
    emit(val!);
  }
}
