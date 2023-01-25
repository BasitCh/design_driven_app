import 'package:flutter_bloc/flutter_bloc.dart';

class ShowHidePasswordCubit extends Cubit<bool> {
  ShowHidePasswordCubit() : super(true);

  void showPassword() => emit(true);
  void hidePassword() => emit(false);
}
