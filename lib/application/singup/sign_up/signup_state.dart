// ignore_for_file: always_specify_types

part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignUpStateInitial extends SignupState {}

class SignUpStateLoading extends SignupState {}

class SignUpSuccess extends SignupState {
  const SignUpSuccess();
  @override
  List<Object> get props => <Object>[];

  @override
  String toString() => 'SignUpSuccess { items:  }';
}

class SignUpStateError extends SignupState {
  const SignUpStateError();
}
