import 'package:flutter_bloc/flutter_bloc.dart';
enum SELECTION {cash,margin}
class ShareTradingCubit extends Cubit<SELECTION> {
  ShareTradingCubit() : super(SELECTION.cash);

  void cash() => emit(SELECTION.cash);
  void margin() => emit(SELECTION.margin);
}
