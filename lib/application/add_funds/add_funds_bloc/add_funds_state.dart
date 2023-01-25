part of 'add_funds_bloc.dart';

abstract class AddFundsState extends Equatable {}

class AddFundsStateInitial extends AddFundsState {
  @override
  List<Object?> get props => [];
}

class AddFundsStateAdding extends AddFundsState {
  AddFundsStateAdding();

  @override
  List<Object?> get props => [];
}

class AddFundsStateAdded extends AddFundsState {
  AddFundsStateAdded({
    required this.addFundsResponse,
  });

  final AddFundsResponse addFundsResponse;

  @override
  List<Object?> get props => [];
}

class AddFundsStateError extends AddFundsState {
  AddFundsStateError({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [];
}
