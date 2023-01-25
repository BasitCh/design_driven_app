// ignore_for_file: always_specify_types

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? email;
  final String? name;
  final String? password;
  final bool? confirmed;
  final bool? hasAccess;
  final bool? needsNewPassword;

  const User(
      {this.email,
      this.name,
      this.password,
      this.confirmed,
      this.needsNewPassword,
      this.hasAccess,});

  User copyWith({
    String? email,
    String? name,
    String? password,
    bool? confirmed,
    bool? needsNewPassword,
    bool? hasAccess,
  }) {
    return User(
        email: email ?? this.email,
        name: name ?? this.name,
        password: password ?? this.password,
        confirmed: confirmed ?? this.confirmed,
        needsNewPassword: needsNewPassword ?? this.needsNewPassword,
        hasAccess: hasAccess ?? this.hasAccess,);
  }

  /// Decode user from Cognito User Attributes
  // factory User.fromUserAttributes(List<CognitoUserAttribute> attributes) {
  //   const user = User();
  //   String? name;
  //   String? email;
  //   bool confirmed = false;
  //   for (var attribute in attributes) {
  //     if (attribute.getName() == 'email') {
  //       email = attribute.getValue();
  //     } else if (attribute.getName() == 'name') {
  //       name = attribute.getValue();
  //     } else if (attribute.getName() != null &&
  //         attribute.getName()!.toLowerCase().contains('verified')) {
  //       if (attribute.getValue() != null &&
  //           attribute.getValue()!.toLowerCase() == 'true') {
  //         confirmed = true;
  //       }
  //     }
  //   }
  //
  //   return user.copyWith(email: email, name: name, confirmed: confirmed);
  // }

  /// Empty user which represents an unauthenticated user.
  static const User empty = User(
    name: '',
    email: '',
    password: '',
    confirmed: false,
    needsNewPassword: false,
    hasAccess: false,
  );

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props =>
      [email, name, password, confirmed, needsNewPassword, hasAccess];
}
