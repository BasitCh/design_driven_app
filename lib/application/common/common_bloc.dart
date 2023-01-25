import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'common_event.dart';
part 'common_state.dart';

class CommonBloc extends Bloc<CommonEvent, CommonState> {
  CommonBloc() : super(CommonStateInitial()) {
    on<OpenDrawer>(_onOpenDrawer);
    on<CloseDrawer>(_onCloseDrawer);
  }

  _onOpenDrawer(OpenDrawer event, Emitter<CommonState> emit) {
    emit(CommonStateOpeningDrawer());
    emit(CommonStateOpenedDrawer());
  }

  _onCloseDrawer(CloseDrawer event, Emitter<CommonState> emit) {
    emit(CommonStateInitial());
  }
}
