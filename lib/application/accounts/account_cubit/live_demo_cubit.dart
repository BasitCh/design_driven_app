import 'package:flutter_bloc/flutter_bloc.dart';
enum SELECTION {live,demo}
class LiveDemoCubit extends Cubit<SELECTION> {
  LiveDemoCubit() : super(SELECTION.demo);

  void live() => emit(SELECTION.live);
  void demo() => emit(SELECTION.demo);
}
