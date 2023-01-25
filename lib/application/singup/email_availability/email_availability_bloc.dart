// ignore_for_file: depend_on_referenced_packages
import 'package:black_bull_markets/domain/signup/request/email_availability_request.dart';
import 'package:black_bull_markets/domain/signup/response/email_availability_response.dart';
import 'package:black_bull_markets/infrastructure/signup/signup_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

part 'email_availability_event.dart';
part 'email_availability_state.dart';

class EmailAvailabilityBloc
    extends Bloc<EmailAvailabilityEvent, EmailAvailabilityState> {
  final SignUpRepository signUpRepository;

  EmailAvailabilityBloc({required this.signUpRepository})
      : super(EmailAvailabilityInitial()) {
    on<CheckEmail>((event, emit) async {
      emit(CheckingEmail());
      final Either<Exception, EmailAvailabilityResponse> emailAvailability =
          await signUpRepository.checkEmail(
        emailAvailabilityRequest: event.request,
      );
      emailAvailability.fold(
        (Exception failure) => emit(
          ErrorCheckingEmail(
            error: failure.toString(),
          ),
        ),
        (EmailAvailabilityResponse emailAvailabilityResponse) =>
            emit(const EmailAvailablityStatus(isAvailable: true)),
      );
    });
  }
}
