part of 'email_availability_bloc.dart';

abstract class EmailAvailabilityState extends Equatable {
  const EmailAvailabilityState();

  @override
  List<Object> get props => [];
}

class EmailAvailabilityInitial extends EmailAvailabilityState {}

class CheckingEmail extends EmailAvailabilityState {}

class EmailAvailablityStatus extends EmailAvailabilityState {
  final bool isAvailable;

  const EmailAvailablityStatus({required this.isAvailable});
}

class ErrorCheckingEmail extends EmailAvailabilityState {
  final String error;

  const ErrorCheckingEmail({required this.error});
}
