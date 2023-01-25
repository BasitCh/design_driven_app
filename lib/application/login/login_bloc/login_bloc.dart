// ignore_for_file: always_specify_types, unrelated_type_equality_checks

import 'dart:async';

import 'package:black_bull_markets/domain/login/LoginRequest/login_request.dart';
import 'package:black_bull_markets/domain/login/login_response/login_response.dart';
import 'package:black_bull_markets/domain/login/password.dart';
import 'package:black_bull_markets/domain/login/username.dart';
import 'package:black_bull_markets/infrastructure/login/login_repository.dart';
import 'package:black_bull_markets/shared/network/utils/api_constant.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository})  : super(const LoginState()) {
    on<LoginUserEmailChanged>(_onUserNameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>((event, emit) async {
      await _onSubmitted(event, emit);
    });
  }

  void _onUserNameChanged(
    LoginUserEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final Email username = Email.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        status: Formz.validate(
          [state.password, username],
        ),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final Password password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.username]),
      ),
    );
  }

  FutureOr<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    LoginResponse? loginResponse = await loginRepository.login(loginRequest: LoginRequest(email: event.email,password: event.password,recaptcha: '',token: ''));
    if(loginResponse!=null) {
      if (loginResponse.status == STATUS.error) {
        emit(LoginError(message: loginResponse.message,errors: loginResponse.errors));
      }
      else if (loginResponse.status == STATUS.success) {
        emit(LoginLoaded(loginResponse: loginResponse));
      }else{
        emit(LoginError(message: loginResponse.message,errors: loginResponse.errors));
      }
    }else{

      emit(const LoginError(message: 'Some thing went wrong'));
    }
    //emit(state.copyWith(status: FormzStatus.submissionSuccess));

  }
}
