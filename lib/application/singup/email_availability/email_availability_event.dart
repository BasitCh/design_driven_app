part of 'email_availability_bloc.dart';

abstract class EmailAvailabilityEvent extends Equatable {
  const EmailAvailabilityEvent();

  @override
  List<Object> get props => [];
}

class CheckEmail extends EmailAvailabilityEvent {
  final EmailAvailabilityRequest request;

  const CheckEmail({required this.request});
}
