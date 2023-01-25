// ignore_for_file: unnecessary_getters_setters

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createToJson: true, checked: true)
class LoginResponse {
  String? _message;
  Errors? _errors;
  String? _status;

  LoginResponse({String? message, String? status, Errors? errors}) {
    if (message != null) {
      _message = message;
    }
    if (errors != null) {
      _errors = errors;
    }
    if (status != null) {
      _status = status;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;

  String? get status => _status;
  set status(String? status) => _status = status;

  Errors? get errors => _errors;
  set errors(Errors? errors) => _errors = errors;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = _message;
    data['status'] = _status;
    if (_errors != null) {
      data['errors'] = _errors!.toJson();
    }
    return data;
  }
}

class Errors {
  List<String>? _email;
  List<String>? _password;

  Errors({List<String>? email, List<String>? password}) {
    if (email != null) {
      _email = email;
    }
    if (password != null) {
      _password = password;
    }
  }

  List<String>? get email => _email;
  set email(List<String>? email) => _email = email;
  List<String>? get password => _password;
  set password(List<String>? password) => _password = password;

  Errors.fromJson(Map<String, dynamic> json) {
    //if(email!=null) {
    _email = json['email'].cast<String>();
    // }
    if (password != null) {
      _password = json['password'].cast<String>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //if(email!=null) {
    data['email'] = _email;
    //  }
    if (password != null) {
      data['password'] = _password;
    }
    return data;
  }
}
