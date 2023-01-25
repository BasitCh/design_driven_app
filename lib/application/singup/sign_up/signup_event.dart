// ignore_for_file: always_specify_types

part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class FetchContacts extends SignupEvent {
  // final SignupRequest signUpDataModel;
  // const FetchContacts({required this.signUpDataModel});
  // @override
  // List<Object> get props => <Object>[signUpDataModel];
}

class FetchContact extends SignupEvent {
  const FetchContact({required this.id});
  final String id;

  @override
  List<Object> get props => <Object>[];
}
