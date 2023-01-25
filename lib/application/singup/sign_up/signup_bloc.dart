import 'package:black_bull_markets/infrastructure/signup/signup_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpRepository contactRepository;

  SignupBloc({required this.contactRepository}) : super(SignUpStateInitial()) {
    on<FetchContacts>(_onSignUp);
  }

  void _onSignUp(
    FetchContacts event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignUpStateLoading());
    // final Either<FailureEntity, SignUpDataModel> contactDataModel =
    //     await contactRepository.signUp(contactRequest: event.signUpDataModel);
    // contactDataModel.fold(
    //   (FailureEntity failure) => emit(const SignUpStateError()),
    //   (SignUpDataModel contactDataModel) => emit(const SignUpSuccess()),
    // );
  }
}
