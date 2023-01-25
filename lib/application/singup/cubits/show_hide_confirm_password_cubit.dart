import 'package:flutter_bloc/flutter_bloc.dart';

class ShowHideConfirmPasswordCubit extends Cubit<bool> {
  ShowHideConfirmPasswordCubit() : super(true);

  void showConfirmPassword() => emit(true);
  void hideConfirmPassword() => emit(false);
}
