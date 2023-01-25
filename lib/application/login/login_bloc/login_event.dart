// ignore_for_file: always_specify_types

part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEmailChanged extends LoginEvent {
  const LoginUserEmailChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  final String password;
  final String email;
  const LoginSubmitted({required this.password,required this.email});
}
