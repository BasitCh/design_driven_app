import 'package:black_bull_markets/shared/core/email_validator.dart';
import 'package:formz/formz.dart';

enum UserEmailValidationError {
  empty(''),
  invalid('');

  final String message;
  const UserEmailValidationError(this.message);
}

class Email extends FormzInput<String, UserEmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  UserEmailValidationError? validator(String? value) {
    return EmailValidator.validate(value!)
        ? null
        : UserEmailValidationError.invalid;
  }
}
