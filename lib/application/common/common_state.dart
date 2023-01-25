part of 'common_bloc.dart';

abstract class CommonState extends Equatable {}

class CommonStateInitial extends CommonState {
  CommonStateInitial();

  @override
  List<Object?> get props => [];
}

class CommonStateLoading extends CommonState {
  CommonStateLoading();

  @override
  List<Object?> get props => [];
}

class CommonStateOpeningDrawer extends CommonState {
  CommonStateOpeningDrawer();

  @override
  List<Object?> get props => [];
}

class CommonStateOpenedDrawer extends CommonState {
  CommonStateOpenedDrawer();

  @override
  List<Object?> get props => [];
}

class CommonStateLoaded extends CommonState {
  CommonStateLoaded();

  @override
  List<Object?> get props => [];
}

class CommonStateError extends CommonState {
  CommonStateError();

  @override
  List<Object?> get props => [];
}
