import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmationAlertBoxCubit extends Cubit<bool?> {
  ConfirmationAlertBoxCubit() : super(null);

  showAlert() async{
    emit(true);
    await Future.delayed(const Duration(milliseconds: 1500,),);
    emit(false);
  }

  hideAlert() {
    emit(false);
  }
}
