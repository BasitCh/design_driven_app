part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.username = const Email.pure(),
    this.password = const Password.pure(),
  });

  final FormzStatus status;
  final Email username;
  final Password password;

  LoginState copyWith({
    FormzStatus? status,
    Email? username,
    Password? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => <Object>[status, username, password];

}
class LoginLoaded extends LoginState {
  final LoginResponse loginResponse;
  const LoginLoaded({required this.loginResponse});
}

class LoginError extends LoginState {
  final String? message;
  final Errors? errors;

  const LoginError({this.message,this.errors});
}
class LoginLoading extends LoginState {}
